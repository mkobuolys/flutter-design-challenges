import 'package:flutter/material.dart';

class BlueTopClipper extends CustomClipper<Path> {
  const BlueTopClipper();

  @override
  Path getClip(Size size) => Path()
    ..lineTo(0.0, 220.0)
    ..quadraticBezierTo(
      size.width / 2.2,
      260.0,
      size.width,
      170.0,
    )
    ..lineTo(size.width, 0.0)
    ..close();

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
