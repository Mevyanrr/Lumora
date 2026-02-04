import 'package:cloud_firestore/cloud_firestore.dart';

enum PeriodeAktivitas {
  bulanLalu,
  bulanIni,
}

class Aktivitas {
  final String id;
  final String title;
  final String description;
  final String fungsi;
  final String actvtotal;
  final int doneCount;
  final int totalCount;
  final bool isCompleted;
  final PeriodeAktivitas periode;

  Aktivitas({
    required this.id,
    required this.title,
    required this.description,
    required this.fungsi,
    required this.actvtotal,
    required this.doneCount,
    required this.totalCount,
    required this.isCompleted,
    required this.periode,
  });

    factory Aktivitas.fromFirestore(DocumentSnapshot doc){
    final data = doc.data() as Map<String, dynamic>;
    String periodeString = data['periode'] ?? 'PeriodeAktivitas.bulanLalu';
    return Aktivitas(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      fungsi: data['fungsi'] ?? '',
      actvtotal: data['actvtotal'] ?? '',
      doneCount: data['doneCount'] ?? 0,
      totalCount: data['totalCount'] ?? 0, 
      isCompleted: data['isCompleted'] ?? false,
      periode: periodeString == 'PeriodeAktivitas.bulanIni' 
          ? PeriodeAktivitas.bulanIni 
          : PeriodeAktivitas.bulanLalu,
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'id' : id,
      'title' : title,
      'description' : description,
      'fungsi' : fungsi,
      'actvtotal': actvtotal,
      'doneCount' : doneCount,
      'totalCount': totalCount,
      'isCompleted' : isCompleted,
      'periode' : periode.toString()
    };
  }

}
