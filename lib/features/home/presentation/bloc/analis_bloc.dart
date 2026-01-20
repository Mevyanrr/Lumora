import 'package:flutter_bloc/flutter_bloc.dart';
import 'analisis_event.dart';
import 'analisis_state.dart';

class AnalisisBloc extends Bloc<AnalisisEvent, AnalisisState> {
  AnalisisBloc() : super(AnalisisInitial()) {

    on<TambahKolomMakanan>((event, emit) {
      final stateNow = state as AnalisisInitial;
      final updated = List<String>.from(stateNow.makanan)..add('');
      emit(stateNow.copyWith(makanan: updated));
    });

    on<UpdateMakanan>((event, emit) {
      final stateNow = state as AnalisisInitial;
      final updated = List<String>.from(stateNow.makanan);
      updated[event.index] = event.value;
      emit(stateNow.copyWith(makanan: updated));
    });

    on<SubmitAnalisis>((event, emit) {
      final data = (state as AnalisisInitial).makanan;
     
     
    });
  }
}
