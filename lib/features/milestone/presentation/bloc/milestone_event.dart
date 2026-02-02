abstract class MilestoneEvent {}

class LoadMilestone extends MilestoneEvent {
  final int totalTask;
  final int completedTask;

  LoadMilestone({
    required this.totalTask,
    required this.completedTask,
  });
}

class FetchAktivitas extends MilestoneEvent {}
