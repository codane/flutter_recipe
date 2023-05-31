import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_recipe/models/recipe_model.dart';

class FirestoreService {
  // ADD
  final CollectionReference _recipesCollection = FirebaseFirestore.instance.collection('recipes').withConverter<Recipe>(
          fromFirestore: (snapshot, _) => Recipe.fromJson(snapshot.data()!),
          toFirestore: (recipe, _) => recipe.toJson());

  Future addNewRecipe(Recipe newRecipe) async {
    _recipesCollection.add(newRecipe);
  }

  // GET - stream
  //Stream<QuerySnapshot> _recipesStream = _recipesCollection.snapshots();
  Stream<QuerySnapshot> get allRecipesStream => _recipesCollection.snapshots();

}
