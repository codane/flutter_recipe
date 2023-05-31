import 'package:flutter/material.dart';
import 'package:flutter_recipe/features/auth/controller/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'top_bezier_container.dart';

class TopHomeScreen extends ConsumerWidget {
  const TopHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
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
    );
  }
}
