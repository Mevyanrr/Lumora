import 'package:lumora/features/milestone/data/models/month_range.dart';

abstract class MonthState {}

class MonthLoading extends MonthState {}

class MonthLoaded extends MonthState{
  final int currentMonth;
  final List<MonthRange> ages;

  MonthLoaded({
    required this.currentMonth,
    required this.ages,
  });
}
