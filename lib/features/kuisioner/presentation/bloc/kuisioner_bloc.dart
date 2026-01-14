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


     //PAGE3
    on<PilKondisiBayi>((event, emit) {
  final Map<String, String> kondisiMap = {
    'A': 'Lahir prematur',
    'B': 'Berat lahir rendah',
    'C': 'Riwayat kejang',
    'D': 'Tidak pernah',
  };

  final String hasilMapping = kondisiMap[event.kondisiBayi] ?? event.kondisiBayi;

  emit(state.copyWith(kondisiBayi: hasilMapping));
});
    
    on<PilKontrol>((event, emit) {
  final Map<String, String> kondisiMap = {
    'A': 'Ya',
    'B': 'Tidak',
  };

  final String hasilMapping = kondisiMap[event.pilKontrol] ?? event.pilKontrol;

  emit(state.copyWith(pilKontrol: hasilMapping));
});

    //PAGE4
    on<PilAktivitasBayi>((event, emit) {
  final Map<String, String> aktivitasMap = {
    'A': 'Tengkurap',
    'B': 'Duduk dengan bantuan',
    'C': 'Duduk sendiri',
    'D': 'Merangkak',
    'E': 'Berdiri dengan pegangan',
    'F': 'Merespon terhadap suara',
    'G': 'Bayi masih berusia dibawah 2 bulan',
    'H': 'Belum bisa semua'
  };

  final String hasilMapping = aktivitasMap[event.aktivitasBayi] ?? event.aktivitasBayi;

  emit(state.copyWith(aktivitasBayi: hasilMapping));
});

    on<SubmitKuisioner>((event, emit) {
      // nanti: validasi / kirim ke backend
      // print(state.nama);
      // print(state.gender);
      // print(state.tanggalLahir);
    });
  }
}
