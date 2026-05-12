import 'package:flutter_bloc/flutter_bloc.dart';
import 'kuisioner_event.dart';
import 'kuisioner_state.dart';

class KuisionerBloc extends Bloc<KuisionerEvent, KuisionerState> {
  KuisionerBloc() : super(const KuisionerState()) {

    //PAGE1
    on<IsiNama>((event, emit) {
      emit(state.copyWith(nama: event.nama));
    });

    on<IsiGender>((event, emit) {
      emit(state.copyWith(gender: event.gender));
    });

    on<IsiTglLahir>((event, emit) {
      emit(state.copyWith(tanggalLahir: event.tanggal));
    });

    //PAGE2
    on<IsiBB>((event, emit) {
      emit(state.copyWith(bb: event.bb));
    });

    on<IsiTB>((event, emit) {
      emit(state.copyWith(tb: event.tb));
    });

    on<IsiLK>((event, emit) {
      emit(state.copyWith(lingkarKepala: event.lingkarKepala));
    });

    //PAGE3 - kondisi bayi (multi-select via toggle)
    on<ToggleKondisiBayi>((event, emit) {
      final current = List<String>.from(state.kondisiBayi);
      if (current.contains(event.kondisi)) {
        current.remove(event.kondisi);
      } else {
        // Jika pilih "Tidak pernah", hapus semua pilihan lain
        if (event.kondisi == 'Tidak pernah') {
          current.clear();
        } else {
          // Jika pilih selain "Tidak pernah", hapus "Tidak pernah" dari list
          current.remove('Tidak pernah');
        }
        current.add(event.kondisi);
      }
      emit(state.copyWith(kondisiBayi: current));
    });

    on<SetKondisiBayi>((event, emit) {
      emit(state.copyWith(kondisiBayi: event.kondisiList));
    });

    on<PilKontrol>((event, emit) {
      emit(state.copyWith(pilKontrol: event.pilKontrol));
    });

    //PAGE4 - aktivitas bayi (multi-select via toggle)
    on<ToggleAktivitasBayi>((event, emit) {
      final current = List<String>.from(state.aktivitasBayi);
      if (current.contains(event.aktivitas)) {
        current.remove(event.aktivitas);
      } else {
        // Jika pilih "Belum bisa semua", hapus semua pilihan lain
        if (event.aktivitas == 'Belum bisa semua') {
          current.clear();
        } else {
          // Jika pilih selain "Belum bisa semua", hapus "Belum bisa semua" dari list
          current.remove('Belum bisa semua');
        }
        current.add(event.aktivitas);
      }
      emit(state.copyWith(aktivitasBayi: current));
    });

    on<SetAktivitasBayi>((event, emit) {
      emit(state.copyWith(aktivitasBayi: event.aktivitasList));
    });

    // Backward compat - deprecated, pakai Toggle
    on<PilAktivitasBayi>((event, emit) {
      emit(state.copyWith(aktivitasBayi: [event.aktivitasBayi]));
    });

    on<PilKondisiBayi>((event, emit) {
      emit(state.copyWith(kondisiBayi: [event.kondisiBayi]));
    });

    on<SubmitKuisioner>((event, emit) {});
  }
}
