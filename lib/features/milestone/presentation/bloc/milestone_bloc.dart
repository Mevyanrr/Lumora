import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'milestone_event.dart';
part 'milestone_state.dart';

class MilestoneBloc extends Bloc<MilestoneEvent, MilestoneState> {
  MilestoneBloc() : super(MilestoneInitial()) {
    on<MilestoneEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
