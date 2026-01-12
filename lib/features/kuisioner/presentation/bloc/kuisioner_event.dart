abstract class KuisionerEvent {}

class IsiNama extends KuisionerEvent {
  final String nama;
  IsiNama(this.nama);
}

class IsiGender extends KuisionerEvent {
  final String gender;
  IsiGender(this.gender);
}

class IsiTglLahir extends KuisionerEvent {
  final DateTime tanggal;
 IsiTglLahir(this.tanggal);
}

class SubmitKuisioner extends KuisionerEvent {}
