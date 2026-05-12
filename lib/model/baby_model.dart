import 'package:cloud_firestore/cloud_firestore.dart';

class BabyModel {
  final String nama;
  final DateTime tanggalLahir;
  final String jenisKelamin;
  final double beratBadan;
  final double tinggiBadan;
  final double lingkarKepala;
  final List<String> riwayatKesehatan;
  final String kontrol;
  final List<String> kondisi;
  final DateTime createdAt;
  final String? alamat;
  final double? latitude;
  final double? longitude;

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
    required this.alamat,
    required this.latitude,
    required this.longitude,
  });

  factory BabyModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    // Helper untuk parse field yang bisa String (lama) atau List<String> (baru)
    List<String> parseStringOrList(dynamic value) {
      if (value == null) return [];
      if (value is List) return List<String>.from(value);
      if (value is String && value.isNotEmpty) return [value];
      return [];
    }

    return BabyModel(
      nama: data['nama'] ?? 'Tidak ada nama',
      tanggalLahir: (data['tanggalLahir'] as Timestamp?)?.toDate() ?? DateTime.now(),
      jenisKelamin: data['jenisKelamin'] ?? 'Tidak diketahui',
      beratBadan: (data['beratBadan'] ?? 0.0).toDouble(),
      tinggiBadan: (data['tinggiBadan'] ?? 0.0).toDouble(),
      lingkarKepala: (data['lingkarKepala'] ?? 0.0).toDouble(),
      riwayatKesehatan: parseStringOrList(data['riwayatKesehatan']),
      kontrol: data['kontrol'] ?? 'Tidak ada kontrol',
      kondisi: parseStringOrList(data['kondisi']),
      createdAt: DateTime.now(),
      alamat: data['address'],
      latitude: (data['latitude'] as num?)?.toDouble(),
      longitude: (data['longitude'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
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