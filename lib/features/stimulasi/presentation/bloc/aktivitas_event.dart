import 'package:lumora/features/stimulasi/data/models/aktivitas.dart';

abstract class AktivitasEvent {}

class LoadAktivitas extends AktivitasEvent {}

class UpdateAktivitasStimulasi extends AktivitasEvent {
  final List<Aktivitas> bulanLalu;
  final List<Aktivitas> bulanIni;
  final bool isAllCompleted;
  UpdateAktivitasStimulasi(this.bulanLalu, this.bulanIni, this.isAllCompleted);
}
  class ActivityStatus extends AktivitasEvent{
  final Aktivitas activity;
  ActivityStatus(this.activity);
  }

