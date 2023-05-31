import 'package:flutter/material.dart';
import 'package:flutter_recipe/widgets/add_recipe_screen.dart';
import 'package:flutter_recipe/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter_recipe/widgets/recipes_widget.dart';
import 'package:flutter_recipe/widgets/top_home_screen.dart';
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
          children: const [
            TopHomeScreen(),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "Popular",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(child: RecipesWidget()),
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
        ),bottomNavigationBar: CustomBottomNavBar(),
        // bottomNavigationBar: BottomNavigationBar(
        //   selectedItemColor: const Color(0xff69140E),
        //   backgroundColor: const Color(0xffD58936),
        //   items: const [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: "Home",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.my_library_books_outlined),
        //       label: "My recipes",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.favorite),
        //       label: "Favorite",
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
