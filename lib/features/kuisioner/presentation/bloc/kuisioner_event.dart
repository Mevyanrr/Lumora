abstract class KuisionerEvent {}

//PAGE1
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

//PAGE2
class IsiBB extends KuisionerEvent {
  final double bb;
  IsiBB(this.bb);
}

class IsiTB extends KuisionerEvent {
  final double tb;
  IsiTB(this.tb);
}

class IsiLK extends KuisionerEvent {
  final double lingkarKepala;
 IsiLK(this.lingkarKepala);
}

//PAGE3
class PilKondisiBayi extends KuisionerEvent {
  final String kondisiBayi;
  PilKondisiBayi(this.kondisiBayi);
}

class PilKontrol extends KuisionerEvent {
  final String pilKontrol;
  PilKontrol(this.pilKontrol);
}

//PAGE4
class PilAktivitasBayi extends KuisionerEvent {
  final String aktivitasBayi;
  PilAktivitasBayi(this.aktivitasBayi);
}

class SubmitKuisioner extends KuisionerEvent {}
