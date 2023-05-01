import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_recipe/models/recipe.dart';
import 'top_custom_clipper.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({Key? key}) : super(key: key);

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController ingridientsController = TextEditingController();
  final TextEditingController preparationController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final recipeCollectionRef = FirebaseFirestore.instance
      .collection('recipes')
      .withConverter<Recipe>(
          fromFirestore: (snapshot, _) => Recipe.fromJson(snapshot.data()!),
          toFirestore: (recipe, _) => recipe.toJson());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: TopCustomClipper(),
                child: Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Colors.orange, Colors.blue],
                    ),
                  ),
                ),
              ),
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
                  "Ingridients",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: TextField(
                  maxLines: 3,
                  controller: ingridientsController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Ingridients"),
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
          child: const Icon(Icons.save),
          onPressed: () {
            recipeCollectionRef.add(
              Recipe(
                  title: titleController.text,
                  ingridients: ingridientsController.text,
                  preparation: preparationController.text,
                  url: urlController.text),
            );
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
