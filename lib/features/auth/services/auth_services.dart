import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lumora/model/baby_model.dart';
import 'package:lumora/model/user_model.dart';

class AuthService {
  final firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ]
  );

  User? get currentUser => firebaseAuth.currentUser;
  Stream<User?> get authStateChange => firebaseAuth.authStateChanges();

  Future<UserCredential> signInWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> createUser ({
    required String name,
    required String email,
  required String password,
    required String confirmPassword
  }) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
        );
  }

  Future<UserCredential?> signInWithGoogle() async {
    try{
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if(googleUser == null){
      return null;
    } 
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken, idToken: googleAuth.idToken 
    );
    final UserCredential = await firebaseAuth.signInWithCredential(credential);
    return UserCredential;
    } catch(e){
      print("gagal login google: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
    return await firebaseAuth.signOut();
  }

  Future<void> resetPassword({required String email}) async {
    return await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> saveUserToFirestore(User user, String name) async {
    final userRef = firestore.collection('user_lumora').doc(user.uid);
    try{
      return userRef.set({
        'uid': user.uid,
        'email': user.email ?? "",
        'name': user.displayName ?? name,
        'photoURL': user.photoURL ?? "",
        'lastSignIn' : FieldValue.serverTimestamp()
    }, SetOptions(merge: true)
    );
    } catch(e){
     print("gagal simpan: $e");
    }
  }

  Future<void> saveProfilePhotoToFirestore(UserModel usermodel) async{
    final String uid = firebaseAuth.currentUser?.uid ?? '';
    final DocumentReference userRef = firestore.collection('user_lumora').doc(uid);
    if (firebaseAuth.currentUser == null) {
      print("User belum login, data tidak bisa disimpan");
      return;
    }
    try{
    await userRef.set(usermodel.toMap(), SetOptions(merge: true));
    }catch(e){
      print("gagal simpan: $e");
    }
  }

    Stream<UserModel?> getUserData() { 
  final userId = firebaseAuth.currentUser?.uid;
  if(userId == null) return Stream.value(null);

  return firestore
      .collection('user_lumora')
      .doc(userId)
      .snapshots()
      .map((snapshot) {
        if(snapshot.exists && snapshot.data() != null){
          return UserModel.fromFirestore(snapshot);
        } 
        return null; 
      });
}

  }