class KuisionerState {

  //page1
  final String nama;
  final String gender;
  final DateTime? tanggalLahir;

  //page2
  final double bb;
  final double tb;
  final double lingkarKepala;

  //page3
  final String kondisiBayi;
  final String pilKontrol;

  //page4
  final String aktivitasBayi;

  const KuisionerState({
    this.nama = '',
    this.gender = '',
    this.tanggalLahir,
    this.bb=0.0,
    this.tb=0.0,
    this.lingkarKepala=0.0,
    this.kondisiBayi='',
    this.pilKontrol='',
    this.aktivitasBayi=''

  });

  KuisionerState copyWith({
    String? nama,
    String? gender,
    DateTime? tanggalLahir,
    double? bb,
    double?tb,
    double? lingkarKepala,
    String? kondisiBayi,
    String? pilKontrol,
    String? aktivitasBayi,
  }) {
    return KuisionerState(
      nama: nama ?? this.nama,
      gender: gender ?? this.gender,
      tanggalLahir: tanggalLahir ?? this.tanggalLahir,
      bb: bb ?? this.bb,
      tb: tb ?? this.tb,
      lingkarKepala: lingkarKepala?? this.lingkarKepala,
      kondisiBayi: kondisiBayi ?? this.kondisiBayi,
      pilKontrol: pilKontrol?? this.pilKontrol,
      aktivitasBayi: aktivitasBayi?? this.aktivitasBayi

    );
  }
}
