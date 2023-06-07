import 'package:flutter/material.dart';

class BottomCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;

    return Path()
    ..moveTo(0, height * 0.3)
    ..quadraticBezierTo(width * 0.14, 0, width * 0.25, height * 0.2)
    ..quadraticBezierTo(width * 0.32, height * 0.4, width * 0.39, height * 0.2)
    ..quadraticBezierTo(width * 0.48, 0, width * 0.59, height * 0.2)
    ..quadraticBezierTo(width * 0.67, height * 0.4, width * 0.75, height * 0.2)
    ..quadraticBezierTo(width * 0.85, 0, width, height * 0.3)
    ..lineTo(width, height)
    ..lineTo(0, height)
    ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
  
}