import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'stimulasi_event.dart';
part 'stimulasi_state.dart';

class StimulasiBloc extends Bloc<StimulasiEvent, StimulasiState> {
  StimulasiBloc() : super(StimulasiInitial()) {
    on<StimulasiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
