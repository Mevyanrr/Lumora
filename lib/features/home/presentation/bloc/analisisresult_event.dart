abstract class AnalisisresultEvent {}

class LoadAnalisisresult extends AnalisisresultEvent {}

class UpdatePersentase extends AnalisisresultEvent {
  final int index;
  final double value;

  UpdatePersentase(this.index, this.value);
}
