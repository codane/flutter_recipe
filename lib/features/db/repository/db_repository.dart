import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_recipe/core/constants/firestore_constants.dart';
import 'package:flutter_recipe/core/providers/firebase_providers.dart';
import 'package:flutter_recipe/models/recipe_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dbRepositoryProvider = Provider.autoDispose(
  (ref) => DBRepository(
    firestore: ref.read(firestoreProvider),
  ),
);

class DBRepository {
  final FirebaseFirestore _firestore;

  DBRepository({required FirebaseFirestore firestore}) : _firestore = firestore;

  CollectionReference get _recipes =>
      _firestore.collection(FirestoreConstants.recipesCollection);

  Future<void> addNewRecipe({required Recipe newRecipe}) async {
    try {
      DocumentReference docRef = _recipes.doc();
      newRecipe.id = docRef.id;
      final recipeToJson = newRecipe.toJson();
      await docRef.set(recipeToJson);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteRecipe({required String recipeId}) async {
    try {
      await _recipes.doc(recipeId).delete();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
