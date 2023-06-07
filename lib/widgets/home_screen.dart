import 'package:flutter/material.dart';
import 'package:flutter_recipe/widgets/add_recipe_screen.dart';
import 'package:flutter_recipe/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter_recipe/widgets/recipes_widget.dart';
import 'package:flutter_recipe/widgets/top_home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navBarIndexProvider = StateProvider<int>((ref) => 0);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF2F3AE),
        body:  Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopHomeScreen(),
            IndexedStack(
              index: ref.watch(navBarIndexProvider),
              children: const [
                RecipesWidget(),
                Center(child: Text("My recipes")),
                Center(child: Text("Favorite")),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffD58936),
          foregroundColor: const Color(0xffF2F3AE),
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddRecipeScreen()),
            );
          },
        ),bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}
