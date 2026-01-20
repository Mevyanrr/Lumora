import 'package:lumora/features/home/data/models/analisisresult_item.dart';

abstract class AnalisisresultState {}

class AnalisisresultInitial extends AnalisisresultState {}

class AnalisisresultLoaded extends AnalisisresultState {
  final List<AnalisisresultItem> items;

  AnalisisresultLoaded(this.items);
}
