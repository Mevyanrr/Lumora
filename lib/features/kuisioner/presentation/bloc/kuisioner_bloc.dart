import 'package:flutter_bloc/flutter_bloc.dart';
import 'kuisioner_event.dart';
import 'kuisioner_state.dart';

class KuisionerBloc extends Bloc<KuisionerEvent, KuisionerState> {
  KuisionerBloc() : super(const KuisionerState()) {
    on<IsiNama>((event, emit) {
      emit(state.copyWith(nama: event.nama));
    });

    on<IsiGender>((event, emit) {
      emit(state.copyWith(gender: event.gender));
    });

    on<IsiTglLahir>((event, emit) {
      emit(state.copyWith(tanggalLahir: event.tanggal));
    });

    on<SubmitKuisioner>((event, emit) {
      // nanti: validasi / kirim ke backend
      // print(state.nama);
      // print(state.gender);
      // print(state.tanggalLahir);
    });
  }
}
