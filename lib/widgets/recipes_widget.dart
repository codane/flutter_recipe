import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_recipe/widgets/recipe_details_screen.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_recipe/models/recipe_model.dart';

class RecipesWidget extends ConsumerStatefulWidget {
  const RecipesWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<RecipesWidget> createState() => _RecipesWidgetState();
}

class _RecipesWidgetState extends ConsumerState<RecipesWidget> {
  final recipesProvider = StreamProvider.autoDispose<List<Recipe>>((ref) {
    final stream = FirebaseFirestore.instance.collection('recipes').snapshots();
    return stream.map((snapshot) =>
        snapshot.docs.map((doc) => Recipe.fromJson(doc.data())).toList());
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F3AE),
      body: ref.watch(recipesProvider).when(
          data: (recipes) {
            return SizedBox(
              height: 300,
              width: double.infinity,
              child: ScrollSnapList(
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RecipeDetails(recipe: recipe)));
                      },
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          children: [
                            SizedBox(
                                height: 230,
                                width: 250,
                                child: Image.network(
                                  recipe.url,
                                  fit: BoxFit.cover,
                                )),
                            Container(
                              height: 70,
                              width: 250,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.amber, Colors.blue])),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                  recipe.title,
                                  style: const TextStyle(fontSize: 18),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: recipes.length,
                itemSize: 250,
                onItemFocus: (index) {},
                dynamicItemSize: true,
              ),
            );
          },
          error: (err, stack) => Center(child: Text(err.toString())),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
