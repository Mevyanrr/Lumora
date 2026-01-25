import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AnalisisService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveMakanan(List<String> makanan) async{
    final String uid = auth.currentUser?.uid ?? '';
    final DocumentReference userRef = firestore.collection('user_lumora').doc(uid);
    if (auth.currentUser == null) {
      print("User belum login, data tidak bisa disimpan");
      return;
    }
    try{
      final docref = firestore.collection('bayi').doc(uid).collection('analisis_makanan').doc();
      await docref.set({
        'makanan': makanan,
        'timestamp': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch(e){
      print("Gagal menyimpan data makanan: $e");
    }
  }

  Future<List<String>> getMakanan() async{
    final String uid = auth.currentUser?.uid ?? '';
    final DocumentReference userRef = firestore.collection('user_lumora').doc(uid);
    if (auth.currentUser == null) {
      print("User belum login, data tidak bisa diambil");
      return [];
    }
    try{
      final querySnapshot = await firestore.collection('bayi').doc(uid).collection('analisis_makanan').orderBy('timestamp', descending: true).limit(1).get();
      if(querySnapshot.docs.isNotEmpty){
        final doc = querySnapshot.docs.first;
        final List<dynamic> makananDynamic = doc['makanan'] ?? [];
        final List<String> makanan = makananDynamic.map((item) => item.toString()).toList();
        return makanan;
      } else {
        return [];
      }
    } catch(e){
      print("Gagal mengambil data makanan: $e");
      return [];
    }
  }
}