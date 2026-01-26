import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumora/features/milestone/presentation/bloc/milestone_event.dart';
import 'package:lumora/features/milestone/presentation/bloc/milestone_state.dart';

class MilestoneBloc
    extends Bloc<MilestoneEvent, MilestoneState> {
  MilestoneBloc() : super(MilestoneInitial()) {
    on<LoadMilestone>((event, emit) {
      final progress =
          event.completedTask / event.totalTask;

      emit(
        MilestoneLoaded(
          totalTask: event.totalTask,
          completedTask: event.completedTask,
          progress: progress.clamp(0.0, 1.0),
        ),
      );
    });
  }
}

