import 'package:flutter/material.dart';
import 'package:flutter_recipe/widgets/bottom_custom_clipper.dart';
import 'package:flutter_recipe/widgets/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBottomNavBar extends ConsumerWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipPath(
      clipper: BottomCustomClipper(),
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xffD58936)),
        child: BottomNavigationBar(
          backgroundColor:const Color(0xffD58936),
          selectedItemColor: const Color(0xffF2F3AE),
          unselectedItemColor: const Color(0xff69140E),
          currentIndex: ref.watch(navBarIndexProvider),
          onTap: (index) {
            ref.read(navBarIndexProvider.notifier).state = index;
          },
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
