class BabyModel {
  final String nama;
  final DateTime tanggalLahir;
  final String jenisKelamin;
  final double beratBadan;
  final double tinggiBadan;
  final double lingkarKepala;
  final String riwayatKesehatan;
  final String kontrol;
  final String kondisi;
  final DateTime createdAt;

  BabyModel({
    required this.nama,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.beratBadan,
    required this.tinggiBadan,
    required this.lingkarKepala,
    required this.riwayatKesehatan,
    required this.kontrol,
    required this.kondisi,
    required this.createdAt,
  });

  factory BabyModel.fromMap(Map<String, dynamic> data){
    return BabyModel(
      nama: data['nama'] ?? 'Tidak ada nama', 
      tanggalLahir: data['tanggalLahir'] ?? DateTime.now(), 
      jenisKelamin: data['jenisKelamin'] ?? 'Tidak diketahui', 
      beratBadan: data['beratBadan'] ?? 0.0, 
      tinggiBadan: data['tinggiBadan'] ?? 0.0, 
      lingkarKepala: data['lingkarKepala'] ?? 0.0, 
      riwayatKesehatan: data['riwayatKesehatan'] ?? 0.0, 
      kontrol: data['kontrol'] ?? 'Tidak ada kontrol', 
      kondisi: data['kondisi'] ?? 'Tidak ada kondisi',
      createdAt: DateTime.now()
      );
  }

  Map<String, dynamic> toMap(){
    return {
      'nama': nama,
      'tanggalLahir': tanggalLahir,
      'jenisKelamin': jenisKelamin,
      'beratBadan': beratBadan,
      'tinggiBadan': tinggiBadan,
      'lingkarKepala': lingkarKepala,
      'riwayatKesehatan': riwayatKesehatan,
      'kontrol': kontrol,
      'kondisi': kondisi,
      'createdAt': createdAt,
    };
  }
}