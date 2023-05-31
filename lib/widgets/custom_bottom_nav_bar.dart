import 'package:flutter/material.dart';
import 'package:flutter_recipe/widgets/bottom_custom_clipper.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomCustomClipper(),
      child: Container(
        height: 70,
        decoration: const BoxDecoration(color: Color(0xffD58936)),
        child:  Stack(
          children:  [
            Positioned(
              left: 30,
              top: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.home),
                  Text("Home"),
                ],
              ),
            ),
            Positioned(
              left: 150,
              top: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.my_library_books_outlined),
                  Text("My recipes"),
                ],
              ),),
            Positioned(
              left: 290,
              top: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.favorite,),
                  Text("Favorite"),
                ],
              ),)
          ],
        ),
      ),
    );
  }
}
