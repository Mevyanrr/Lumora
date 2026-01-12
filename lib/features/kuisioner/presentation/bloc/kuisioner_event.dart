abstract class KuisionerEvent {}

class NamaChanged extends KuisionerEvent {
  final String nama;
  NamaChanged(this.nama);
}

class GenderChanged extends KuisionerEvent {
  final String gender;
  GenderChanged(this.gender);
}

class TanggalLahirChanged extends KuisionerEvent {
  final DateTime tanggal;
  TanggalLahirChanged(this.tanggal);
}

class SubmitKuisioner extends KuisionerEvent {}
