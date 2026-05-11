import 'package:cloud_firestore/cloud_firestore.dart';

class AktivitasTemplate {
  final String id;
  final String title;
  final String description;
  final String fungsi;
  final String actvtotal;
  final int totalCount;

  AktivitasTemplate({
    required this.id,
    required this.title,
    required this.description,
    required this.fungsi,
    required this.actvtotal,
    required this.totalCount,
  });

  factory AktivitasTemplate.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AktivitasTemplate(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      fungsi: data['fungsi'] ?? '',
      actvtotal: data['actvtotal'] ?? '',
      totalCount: data['totalCount'] ?? 4,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'fungsi': fungsi,
      'actvtotal': actvtotal,
      'totalCount': totalCount,
    };
  }
}
