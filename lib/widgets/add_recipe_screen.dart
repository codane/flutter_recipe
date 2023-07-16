import 'package:flutter/material.dart';
import 'package:flutter_recipe/features/db/controller/db_controller.dart';
import 'package:flutter_recipe/models/recipe_model.dart';
import 'package:flutter_recipe/widgets/top_bezier_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddRecipeScreen extends ConsumerStatefulWidget {
  const AddRecipeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends ConsumerState<AddRecipeScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
  final TextEditingController preparationController = TextEditingController();
  final TextEditingController urlController = TextEditingController();

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
            ref.read(dbControllerProvider).addNewRecipe(newRecipe: newRecipe);
            //recipeCollectionRef.add(newRecipe);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
