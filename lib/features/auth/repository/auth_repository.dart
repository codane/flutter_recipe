import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_recipe/core/providers/firebase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider.autoDispose(
  (ref) => AuthRepository(
    auth: ref.read(firebaseAuthProvider),
    firestore: ref.read(firestoreProvider),
  ),
);

class AuthRepository {
  // final because they need to be passed to constructor
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthRepository(
      {required FirebaseAuth auth, required FirebaseFirestore firestore})
      : _auth = auth,
        _firestore = firestore;

  void registerUser({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential.user);
    } catch (e) {
      print(e);
    }
  }

  void loginUser({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      print(userCredential.user);
    } catch (e) {
      print(e);
    }
  }

  void signOut() async {
    await _auth.signOut();
  }

  bool isUserLoggedIn() {
    if(_auth.currentUser != null) {
      return true;
    } 
    return false;
  }

   Stream<User?> get userStatus => _auth.authStateChanges();
  //Stream? userStatus() => _auth.authStateChanges();
}
