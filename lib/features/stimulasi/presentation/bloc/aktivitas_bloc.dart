import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/features/stimulasi/data/models/aktivitas.dart';
import 'package:lumora/features/stimulasi/presentation/bloc/aktivitas_event.dart';
import 'package:lumora/features/stimulasi/presentation/bloc/aktivitas_state.dart';

class AktivitasBloc extends Bloc<AktivitasEvent, AktivitasState> {
  AktivitasBloc() : super(AktivitasLoading()) {
    on<LoadAktivitas>((event, emit) {
      final allData = [
         Aktivitas(
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

      emit(
        AktivitasLoaded(
          bulanLalu: allData
              .where((e) => e.periode == PeriodeAktivitas.bulanLalu)
              .toList(),
          bulanIni: allData
              .where((e) => e.periode == PeriodeAktivitas.bulanIni)
              .toList(),
        ),
      );
    });
  }
}

