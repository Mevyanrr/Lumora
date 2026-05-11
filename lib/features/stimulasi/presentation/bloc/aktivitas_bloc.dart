import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/features/stimulasi/data/models/aktivitas.dart';
import 'package:lumora/features/stimulasi/presentation/bloc/aktivitas_event.dart';
import 'package:lumora/features/stimulasi/presentation/bloc/aktivitas_state.dart';
import 'package:lumora/features/stimulasi/services/stimulasi_service.dart';

class AktivitasBloc extends Bloc<AktivitasEvent, AktivitasState> {
  final StimulasiService stimulasi;
  StreamSubscription? _streamSubscription;
  StreamSubscription? _streakSubscription;
  int _currentStreak = 0;

  AktivitasBloc(this.stimulasi) : super(AktivitasLoading()) {
    on<LoadAktivitas>((event, emit) async {
      // 1. Init stream streak
      _streakSubscription?.cancel();
      _streakSubscription = stimulasi.getStreakStream().listen((streak) {
        add(UpdateStreak(streak));
      });

      // 2. Ambil tanggalLahir bayi dari Firestore & init aktivitas dari template
      try {
        final uid = FirebaseAuth.instance.currentUser?.uid;
        if (uid != null) {
          final bayiDoc = await FirebaseFirestore.instance
              .collection('bayi')
              .doc(uid)
              .get();
          final birthDateTimestamp = bayiDoc.data()?['tanggalLahir'];
          if (birthDateTimestamp != null) {
            final birthDate = (birthDateTimestamp as Timestamp).toDate();
            await stimulasi.initAktivitasFromTemplate(birthDate);
          }
        }
      } catch (e) {
        print('Gagal mengambil tanggal lahir: $e');
      }

      // 3. Listen ke aktivitas user secara realtime
      _streamSubscription?.cancel();
      _streamSubscription = stimulasi.getActivityFromFirestore().listen((activities) {
        if (activities.isEmpty) return;

        final listBulanLalu = activities.where((e) => e.periode == PeriodeAktivitas.bulanLalu).toList();
        final listBulanIni = activities.where((e) => e.periode == PeriodeAktivitas.bulanIni).toList();
        final bool isAllCompleted =
            listBulanIni.isNotEmpty && listBulanIni.every((e) => e.isCompleted == true);

        add(UpdateAktivitasStimulasi(listBulanLalu, listBulanIni, isAllCompleted));
      });
    });

    on<UpdateAktivitasStimulasi>((event, emit) {
      emit(AktivitasLoaded(
        bulanLalu: event.bulanLalu,
        bulanIni: event.bulanIni,
        isAllCompleted: event.isAllCompleted,
        streakCount: _currentStreak,
      ));
    });

    on<UpdateStreak>((event, emit) {
      _currentStreak = event.streakCount;
      if (state is AktivitasLoaded) {
        final currentState = state as AktivitasLoaded;
        emit(AktivitasLoaded(
          bulanLalu: currentState.bulanLalu,
          bulanIni: currentState.bulanIni,
          isAllCompleted: currentState.isAllCompleted,
          streakCount: _currentStreak,
        ));
      }
    });

    on<ActivityStatus>((event, emit) async {
      final old = event.activity;
      if (old.doneCount >= old.totalCount) return;

      final newDoneCount = old.doneCount + 1;
      final isNowCompleted = newDoneCount >= old.totalCount;

      final updatedActivity = Aktivitas(
        id: old.id,
        title: old.title,
        description: old.description,
        fungsi: old.fungsi,
        actvtotal: old.actvtotal,
        periode: old.periode,
        doneCount: newDoneCount,
        totalCount: old.totalCount,
        isCompleted: isNowCompleted,
      );

      await stimulasi.updateActivityProgress(updatedActivity);
      await stimulasi.updateStreak();
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    _streakSubscription?.cancel();
    return super.close();
  }
}
