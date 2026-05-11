import 'package:cloud_firestore/cloud_firestore.dart';

class StimulateDate {
  final DateTime targetDate;
  final bool isCompleted;

  StimulateDate({
    required this.targetDate,
    required this.isCompleted
  });

  factory StimulateDate.fromFirestore(DocumentSnapshot doc){
    final data = doc.data() as Map<String, dynamic>;
    DateTime parsedDate;
    final raw = data['targetDate'];
    if (raw is Timestamp) {
      parsedDate = raw.toDate();
    } else {
      // Data lama mungkin tersimpan dalam format tidak valid — kembalikan tanggal masa lalu
      // agar _initStream otomatis mereset ke bulan depan
      parsedDate = DateTime(2000, 1, 1);
    }
    return StimulateDate(
      targetDate: parsedDate,
      isCompleted: data['isCompleted'] ?? false
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'targetDate': Timestamp.fromDate(targetDate),
      'isCompleted': isCompleted
    };
  }
}