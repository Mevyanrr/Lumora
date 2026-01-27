import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lumora/features/profile/domain/models/informasi_bayi_item.dart';
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

  Stream<BabyModel?> getKuisionerData() { 
  final userId = auth.currentUser?.uid;
  if(userId == null) return Stream.value(null);

  return firestore
      .collection('bayi')
      .doc(userId)
      .snapshots()
      .map((snapshot) {
        if(snapshot.exists && snapshot.data() != null){
          return BabyModel.fromFirestore(snapshot);
        } 
        return null; 
      });
}

Future<void> updateDataBayi(BabyModel babymodel) async{
  try{
    final String uid = auth.currentUser?.uid ?? '';
    final DocumentReference docRef = firestore.collection('bayi').doc(uid);
    await docRef.update(babymodel.toMap());

    await docRef.update({
      'updatedAt': FieldValue.serverTimestamp()
    });
  } catch(e){
    print("Gagal mengupdate data bayi: $e");
    }
  }
}