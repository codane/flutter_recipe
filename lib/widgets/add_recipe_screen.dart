import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_recipe/core/constants/firestore_constants.dart';
import 'package:flutter_recipe/models/recipe_model.dart';
import 'package:flutter_recipe/widgets/top_bezier_container.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({Key? key}) : super(key: key);

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
  final TextEditingController preparationController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final recipeCollectionRef = FirebaseFirestore.instance
      .collection(FirestoreConstants.recipesCollection)
      .withConverter<Recipe>(
          fromFirestore: (snapshot, _) => Recipe.fromJson(snapshot.data()!),
          toFirestore: (recipe, _) => recipe.toJson());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF2F3AE),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBezierContainer(),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(
                  "Title",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Recipe title"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(
                  "Url",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: TextField(
                  controller: urlController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Recipe image url"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: TextField(
                  maxLines: 3,
                  controller: ingredientsController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Ingredients"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(
                  "Preparation",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: TextField(
                  maxLines: 3,
                  controller: preparationController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Preparation"),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffD58936),
          foregroundColor: const Color(0xffF2F3AE),
          child: const Icon(Icons.save),
          onPressed: () {
            final Recipe newRecipe = Recipe(
              title: titleController.text.trim(), 
              ingredients: ingredientsController.text.trim(), 
              preparation: preparationController.text.trim(), 
              url: urlController.text.trim(),);
            recipeCollectionRef.add(newRecipe);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
