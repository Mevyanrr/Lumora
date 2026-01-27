abstract class MonthEvent {}

class LoadMonth extends MonthEvent {
  final int currentMonth; 
  LoadMonth(this.currentMonth);
}
