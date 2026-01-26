

import 'package:lumora/features/milestone/data/models/catatan.dart';
import 'package:lumora/features/milestone/data/models/rekomendasi_aktvitas.dart';

abstract class NextstepState {}

class NextstepInitial extends NextstepState {}

class NextstepLoading extends NextstepState {}

class NextstepLoaded extends NextstepState {
  final String desc;
  final String img;
  final RekomendasiAktivitas rekomendasi;
  final Catatan note;

  NextstepLoaded({
    required this.desc,
    required this.img,
    required this.rekomendasi,
    required this.note,
  });
}
