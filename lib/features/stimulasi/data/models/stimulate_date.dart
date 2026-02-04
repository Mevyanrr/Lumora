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
    return StimulateDate(
      targetDate: (data['targetDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
      isCompleted: data['isCompleted'] ?? false
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'targetDate': targetDate,
      'isCompleted': isCompleted
    };
  }
}