abstract class AnalisisEvent {}

class TambahKolomMakanan extends AnalisisEvent {}

class UpdateMakanan extends AnalisisEvent {
  final int index;
  final String value;

  UpdateMakanan(this.index, this.value);
}

class SubmitAnalisis extends AnalisisEvent {}
