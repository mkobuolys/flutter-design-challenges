import 'package:flutter/material.dart';

class GreyTopClipper extends CustomClipper<Path> {
  const GreyTopClipper();

  @override
  Path getClip(Size size) => Path()
    ..lineTo(0.0, 265.0)
    ..quadraticBezierTo(
      size.width / 2,
      285.0,
      size.width,
      185.0,
    )
    ..lineTo(size.width, 0.0)
    ..close();

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
