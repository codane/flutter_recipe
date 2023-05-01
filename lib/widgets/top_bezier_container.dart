import 'package:flutter/material.dart';
import 'top_custom_clipper.dart';

class TopBezierContainer extends StatelessWidget {
  const TopBezierContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopCustomClipper(),
      child: Container(
        height: 150,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.orange, Colors.blue])),
      ),
    );
  }
}
