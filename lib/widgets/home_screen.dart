import 'package:flutter/material.dart';
import 'package:flutter_recipe/widgets/add_recipe_screen.dart';
import 'package:flutter_recipe/widgets/recipes_widget.dart';
import 'top_custom_clipper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipPath(
            clipper: TopCustomClipper(),
            child: Container(
              height: 150,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft, 
                  end: Alignment.topRight, 
                  colors: [Colors.orange, Colors.blue])),
              ),
            ),
           const  Text(
            "Recipes",
            style: TextStyle(
              fontSize: 40,
              fontStyle: FontStyle.italic,
            ),
            ),
            const SizedBox(height: 50,),
            const Expanded(
              child: RecipesWidget()),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddRecipeScreen()),
            );
          },
        ),
      ),
    );
  }
}
