abstract class CountdownEvent {}

class StartCountdown extends CountdownEvent {
  final DateTime targetDate;
  StartCountdown(this.targetDate);
}

class SaveTargetDate extends CountdownEvent{
  final DateTime newDate;
  SaveTargetDate(this.newDate);
}

class TargetDataChanged extends CountdownEvent {
  final DateTime? date;
  TargetDataChanged(this.date);
}

class UpdateStimulationStatus extends CountdownEvent {
  final bool isCompleted;
  
  UpdateStimulationStatus(this.isCompleted);
}

class TickCountdown extends CountdownEvent {}
