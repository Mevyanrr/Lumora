import 'package:lumora/features/stimulasi/data/models/aktivitas.dart';

abstract class AktivitasState {}

class AktivitasLoading extends AktivitasState {}

class AktivitasLoaded extends AktivitasState {
  final List<Aktivitas> bulanLalu;
  final List<Aktivitas> bulanIni;
  final bool isAllCompleted;
  final int streakCount;

  AktivitasLoaded({
    required this.bulanLalu,
    required this.bulanIni,
    required this.isAllCompleted,
    this.streakCount = 0,
  });
}



