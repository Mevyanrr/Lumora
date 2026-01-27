import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String nama;
  final String email;
  final String photoURL;
  final DateTime lastSignIn;

  UserModel({
    required this.nama,
    required this.email,
    required this.photoURL,
    required this.lastSignIn
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc){
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      nama: data['name'] ?? 'Tidak ada nama',
      email: data['email'] ?? 'email terenkripsi',
      photoURL: data['photoURL'] ?? '',
      lastSignIn: data['createdAt']?? DateTime.now());
  }

  Map<String, dynamic> toMap(){
    return{
      'name' : nama,
      'email' : email,
      'photoURL' : photoURL,
      'lastSignIn' : lastSignIn
    };
  }

}