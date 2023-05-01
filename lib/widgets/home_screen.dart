import 'package:flutter/material.dart';
import 'package:flutter_recipe/widgets/add_recipe_screen.dart';
import 'package:flutter_recipe/widgets/recipes_widget.dart';
import 'package:flutter_recipe/widgets/top_bezier_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            TopBezierContainer(),
            Text(
            "Recipes",
            style: TextStyle(
              fontSize: 40,
              fontStyle: FontStyle.italic,
            ),
            ),
            SizedBox(height: 50,),
            Expanded(
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
