import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe/models/recipe.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({Key? key, required this.recipe}) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity * 0.5,
            child: Image.network(recipe.url, fit: BoxFit.cover,),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.5,
              maxChildSize: 0.8,
              minChildSize: 0.5,
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffD58936),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: SizedBox(
                              width: 40,
                              child: Divider(
                                color: Colors.black12,
                                thickness: 3,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Text(
                              recipe.title,
                              style: const TextStyle(
                                  fontSize: 30, fontStyle: FontStyle.italic),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Divider(thickness: 2),
                          const Text(
                            "Ingridients",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            recipe.ingridients,
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(thickness: 2),
                          const Text(
                            "Preparation",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            recipe.preparation,
                            style: const TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    ));
  }
}
