import 'package:flutter/material.dart';

class WhiteTopClipper extends CustomClipper<Path> {
  const WhiteTopClipper();

  @override
  Path getClip(Size size) => Path()
    ..lineTo(0.0, 310.0)
    ..quadraticBezierTo(
      size.width / 2,
      310.0,
      size.width,
      200.0,
    )
    ..lineTo(size.width, 0.0)
    ..close();

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
