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

     //PAGE3
    on<PilKondisiBayi>((event, emit) {
      emit(state.copyWith(kondisiBayi: event.kondisiBayi));
    });
    
    on<PilKontrol>((event, emit) {
      emit(state.copyWith(pilKontrol: event.pilKontrol));
    });

    //PAGE4
    on<PilAktivitasBayi>((event, emit) {
      emit(state.copyWith(aktivitasBayi: event.aktivitasBayi));
    });

    on<SubmitKuisioner>((event, emit) {
      // nanti: validasi / kirim ke backend
      // print(state.nama);
      // print(state.gender);
      // print(state.tanggalLahir);
    });
  }
}
