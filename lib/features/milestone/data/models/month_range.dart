class MonthRange {
  final int start;
  final int end;

  MonthRange(this.start, this.end);

  String get label => "$start–$end";
}
