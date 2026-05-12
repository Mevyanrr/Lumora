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

//PAGE3 - toggle item di list (multi-select)
class ToggleKondisiBayi extends KuisionerEvent {
  final String kondisi;
  ToggleKondisiBayi(this.kondisi);
}

class SetKondisiBayi extends KuisionerEvent {
  final List<String> kondisiList;
  SetKondisiBayi(this.kondisiList);
}

class PilKontrol extends KuisionerEvent {
  final String pilKontrol;
  PilKontrol(this.pilKontrol);
}

//PAGE4 - toggle item di list (multi-select)
class ToggleAktivitasBayi extends KuisionerEvent {
  final String aktivitas;
  ToggleAktivitasBayi(this.aktivitas);
}

class SetAktivitasBayi extends KuisionerEvent {
  final List<String> aktivitasList;
  SetAktivitasBayi(this.aktivitasList);
}

// Tetap ada untuk backward compatibility di data_bayi_view
class PilAktivitasBayi extends KuisionerEvent {
  final String aktivitasBayi;
  PilAktivitasBayi(this.aktivitasBayi);
}

class PilKondisiBayi extends KuisionerEvent {
  final String kondisiBayi;
  PilKondisiBayi(this.kondisiBayi);
}

class SubmitKuisioner extends KuisionerEvent {}
