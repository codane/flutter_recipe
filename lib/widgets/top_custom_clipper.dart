import 'package:flutter/material.dart';


class TopCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double width = size.width;
    final double height = size.height;
    return Path()
    ..lineTo(0, height)
    ..cubicTo(width * 0.4, height , width * 0.4, height * 0.2, width, height * 0.3)
    ..lineTo(width, 0)
    ..close();
  
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}