abstract class AnalisisState {}

class AnalisisInitial extends AnalisisState {
  final List<String> makanan;

  AnalisisInitial({this.makanan = const ['']});

  AnalisisInitial copyWith({List<String>? makanan}) {
    return AnalisisInitial(
      makanan: makanan ?? this.makanan,
    );
  }
}
