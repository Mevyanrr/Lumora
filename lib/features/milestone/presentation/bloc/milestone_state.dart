abstract class MilestoneState {}

class MilestoneInitial extends MilestoneState {}

class MilestoneLoaded extends MilestoneState {
  final int totalTask;
  final double progress;
  final int completedTask; 

  MilestoneLoaded({
    required this.totalTask,
    required this.completedTask,
    required this.progress,
  });
}

class AktivitasLoaded extends MilestoneState {
  final int count;

  AktivitasLoaded(this.count);
}

class AktivitasError extends MilestoneState {
  final String message;

  AktivitasError(this.message);
}
