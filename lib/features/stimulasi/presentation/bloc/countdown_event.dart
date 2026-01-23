abstract class CountdownEvent {}

class StartCountdown extends CountdownEvent {
  final DateTime targetDate;
  StartCountdown(this.targetDate);
}

class TickCountdown extends CountdownEvent {}
