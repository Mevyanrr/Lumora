import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ProfileService {
  FirebaseAuth auth = FirebaseAuth.instance;
  ProfileService._();
  static final ProfileService instance = ProfileService._();
  final ImagePicker pick = ImagePicker();
  String? ImageUrl;
  File? selectedImage;


  Future<void>pickImage() async{
    try{
      XFile? resp = await pick.pickImage(source: ImageSource.gallery);
      if(resp != null){
        selectedImage = File(resp.path);
        await uploadImageToFirebase(File(resp.path));
      }
    }catch(e){

    }
  }

  Future<void> uploadImageToFirebase(File image) async{
    final uid = auth.currentUser!.uid;
    try{
      final ref = FirebaseStorage.instance
      .ref()
      .child("lumora_profile_images/$uid.png");
      await ref.putFile(image);
      ImageUrl = await ref.getDownloadURL();
      print("Upload success: $ImageUrl");
    }catch(e){
      print("upload gagal: $e" );
    }
  }
}