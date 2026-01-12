class KuisionerState {
  final String nama;
  final String gender;        // 'L' / 'P'
  final DateTime? tanggalLahir;

  const KuisionerState({
    this.nama = '',
    this.gender = 'L',
    this.tanggalLahir,
  });

  KuisionerState copyWith({
    String? nama,
    String? gender,
    DateTime? tanggalLahir,
  }) {
    return KuisionerState(
      nama: nama ?? this.nama,
      gender: gender ?? this.gender,
      tanggalLahir: tanggalLahir ?? this.tanggalLahir,
    );
  }
}
