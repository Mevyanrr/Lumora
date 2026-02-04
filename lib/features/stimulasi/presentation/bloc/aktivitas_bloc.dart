import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/features/stimulasi/data/models/aktivitas.dart';
import 'package:lumora/features/stimulasi/presentation/bloc/aktivitas_event.dart';
import 'package:lumora/features/stimulasi/presentation/bloc/aktivitas_state.dart';
import 'package:lumora/features/stimulasi/services/stimulasi_service.dart';

class AktivitasBloc extends Bloc<AktivitasEvent, AktivitasState> {
  final StimulasiService stimulasi;
  StreamSubscription? _streamSubscription;


  AktivitasBloc(this.stimulasi) : super(AktivitasLoading()) {
    on<LoadAktivitas>((event, emit) {
      _streamSubscription?.cancel();
      _streamSubscription = stimulasi.getActivityFromFirestore().listen((activities){
        List<Aktivitas> finalData = activities;

        if(activities.isEmpty){
          final dummyData = getHardData();
          for(var item in dummyData){
            stimulasi.updateActivityProgress(item);
          }
          return;
        }
      final listBulanLalu = finalData.where((e) => e.periode == PeriodeAktivitas.bulanLalu).toList();
      final listBulanIni = finalData.where((e) => e.periode == PeriodeAktivitas.bulanIni).toList();
      final bool isAllCompleted = listBulanIni.isNotEmpty && listBulanIni.every((e) => e.isCompleted == true);

      add(UpdateAktivitasStimulasi(listBulanLalu, listBulanIni, isAllCompleted
      ));
      });
    });

      on<UpdateAktivitasStimulasi>((event, emit){
        emit(AktivitasLoaded(
          bulanLalu: event.bulanLalu, bulanIni: event.bulanIni, isAllCompleted: event.isAllCompleted
          ));
      });

      on<ActivityStatus>((event, emit) async {
        final old = event.activity;
    if (old.doneCount >= old.totalCount) return;

    final newDoneCount = old.doneCount + 1;
    final isNowCompleted = newDoneCount >= old.totalCount;

    final updateActivity = Aktivitas(
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

    await stimulasi.updateActivityProgress(updateActivity);

      });
      // emit(
      //   AktivitasLoaded(
      //     bulanLalu: listBulanLalu,
      //     bulanIni: listBulanIni,
      //     isAllCompleted: isAllCompleted
      //   ),
      // );

    }
  }

  List<Aktivitas> getHardData(){
    return[
       Aktivitas(
          id: 'tummy_time',
          title: "Tummy Time",
          description: "Latih Si Kecil untuk tengkurap 3 menit sehari, dampingi dan awasi selama tengkurap ya parent",
          fungsi: "Melatih kemampuan sensorik & motorik",
          actvtotal: "Lakukan 4 kali selama sebulan",
          doneCount: 0,
          totalCount: 30,
          isCompleted: false,
          periode: PeriodeAktivitas.bulanLalu,
        ),
        Aktivitas(
          id: 'sayur_buah',
          title: "Eksplorasi Sayur dan Buah",
          description: "Ajak Si Kecil memegang buah atau sayuran matang dengan berbagai bentuk",
          fungsi: "Melatih kemampuan sensorik & motorik",
          actvtotal: "Lakukan 4 kali selama sebulan",
          doneCount: 0,
          totalCount: 4,
          isCompleted: false,
          periode: PeriodeAktivitas.bulanIni,
        ),
         Aktivitas(
          id: 'sayur_buah2',
          title: "Eksplorasi Sayur dan Buah",
          description: "Ajak Si Kecil memegang buah atau sayuran matang dengan berbagai bentuk",
          fungsi: "Melatih kemampuan sensorik & motorik",
          actvtotal: "Lakukan 4 kali selama sebulan",
          doneCount: 0,
          totalCount: 4,
          isCompleted: false,
          periode: PeriodeAktivitas.bulanIni,
        ),
    ];
  }


