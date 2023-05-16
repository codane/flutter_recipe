import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_recipe/features/auth/controller/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider = Provider.autoDispose((ref) => FirebaseAuth.instance);
final firestoreProvider = Provider.autoDispose((ref) => FirebaseFirestore.instance);
final authStatusProvider = StreamProvider.autoDispose((ref) {
  return ref.read(authControllerProvider).userStatus;
});