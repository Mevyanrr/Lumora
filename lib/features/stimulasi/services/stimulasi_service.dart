import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lumora/features/stimulasi/data/models/aktivitas.dart';
import 'package:lumora/features/stimulasi/data/models/stimulate_date.dart';

class StimulasiService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  

  Future<void> updateActivityProgress(Aktivitas aktivitas) async {
    final String uid = auth.currentUser?.uid ?? '';
    try{
      final docref = firestore.collection('bayi').doc(uid).collection('stimulasi').doc(uid).collection('aktivitas').doc(aktivitas.id);
      await docref.set(aktivitas.toMap(), SetOptions(merge: true));
    }catch(e){
      print("gagal menyimpan aktivitas $e");
    }
  }

  Stream<List<Aktivitas>> getActivityFromFirestore(){
    final uid = auth.currentUser?.uid ?? '';
    if(uid == null){
      return Stream.value([]);
    }

    return firestore.collection('bayi').doc(uid).collection('stimulasi').doc(uid).collection('aktivitas').snapshots().map((querySnapshot){
      return querySnapshot.docs.map((doc){
        return Aktivitas.fromFirestore(doc);
      }).toList();
    });
  }

  Future<void> saveDate(StimulateDate stimulate_date) async {
    final String uid = auth.currentUser?.uid ?? '';
    try{
      final docref = firestore.collection('bayi').doc(uid).collection('stimulasi').doc(uid);
      await docref.set(stimulate_date.toMap(), SetOptions(merge: true));
    }catch(e){
      print("gagal menyimpan data $e");
    }
  }

  Stream<StimulateDate?> getDateFromFirestore() {
    final uid = auth.currentUser?.uid;
    if(uid == null) return Stream.value(null);

    return firestore
    .collection('bayi')
    .doc(uid)
    .collection('stimulasi')
    .doc(uid)
    .snapshots()
    .map((snapshot){
      if(snapshot.exists && snapshot.data() != null){
        return StimulateDate.fromFirestore(snapshot);
      }
      return null;
    });
  }

    Future<void> saveProgress(Aktivitas activity) async {
    final String uid = auth.currentUser?.uid ?? '';
    try{
      final docref = firestore.collection('bayi').doc(uid).collection('stimulasi').doc(uid);
      await docref.set(activity.toMap(), SetOptions(merge: true));
    }catch(e){
      print("gagal menyimpan data $e");
    }
  }

  //   Stream<Aktivitas?> getActivityFromFirestore() {
  //   final uid = auth.currentUser?.uid;
  //   if(uid == null) return Stream.value(null);

  //   return firestore
  //   .collection('bayi')
  //   .doc(uid)
  //   .collection('stimulasi')
  //   .doc(uid)
  //   .snapshots()
  //   .map((snapshot){
  //     if(snapshot.exists && snapshot.data() != null){
  //       return Aktivitas.fromFirestore(snapshot);
  //     }
  //     return null;
  //   });
  // }

}