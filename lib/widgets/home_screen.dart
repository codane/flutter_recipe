import 'package:flutter/material.dart';
import 'package:flutter_recipe/features/auth/controller/auth_controller.dart';
import 'package:flutter_recipe/widgets/add_recipe_screen.dart';
import 'package:flutter_recipe/widgets/recipes_widget.dart';
import 'package:flutter_recipe/widgets/top_bezier_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF2F3AE),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Stack(
                children: [
                  const TopBezierContainer(),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 25),
                      child: Text(
                        "\"Cooking is the art\n of adjustment\"",
                        style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                        ),
                    )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      iconSize: 30,
                      onPressed: () {
                        ref.read(authControllerProvider).signOut();
                      },
                      icon: const Icon(Icons.logout),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "Popular",
                style: TextStyle(
                  fontSize: 20,
                  
                ),
              ),
            ),
            // OutlinedButton(
            //     onPressed: () {
            //       ref.read(authControllerProvider).signOut();
            //     },
            //     child: Text("Sign out")),
            const SizedBox(
              height: 20,
            ),
            const Expanded(child: RecipesWidget()),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffD58936),
          foregroundColor: const Color(0xff69140E),
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddRecipeScreen()),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xff69140E),
          backgroundColor: const Color(0xffD58936),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books_outlined),
              label: "My recipes",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
            ),
          ],
        ),
      ),
    );
  }
}
