import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lumora/model/baby_model.dart';

class KuisionerService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> saveKuisionerData(BabyModel babymodel) async {
    final String uid = auth.currentUser?.uid ?? '';
    final DocumentReference userRef = firestore.collection('user_lumora').doc(uid);
    if (auth.currentUser == null) {
      print("User belum login, data tidak bisa disimpan");
      return;
    }
    try{
      final docref = firestore.collection('bayi').doc(uid);
      await docref.set(babymodel.toMap(), SetOptions(merge: true));
    } catch(e){
      print("Gagal menyimpan data kuisioner: $e");
    }
  }
}