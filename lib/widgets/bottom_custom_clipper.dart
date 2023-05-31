import 'package:flutter/material.dart';

class BottomCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;

    return Path()
    ..moveTo(0, height * 0.5)
    ..quadraticBezierTo(width * 0.08, 0, width * 0.22, height * 0.2)
    ..quadraticBezierTo(width * 0.32, height * 0.4, width * 0.41, height * 0.2)
    ..quadraticBezierTo(width * 0.51, 0, width * 0.61, height * 0.2)
    ..quadraticBezierTo(width * 0.7, height * 0.4, width * 0.8, height * 0.2)
    ..quadraticBezierTo(width * 0.92, 0, width, height * 0.4)
    ..lineTo(width, height)
    ..lineTo(0, height)
    ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
  
}