import 'package:flutter/material.dart';

class WhiteTopClipper extends CustomClipper<Path> {
  final double yOffset;

  const WhiteTopClipper({
    required this.yOffset,
  });

  @override
  Path getClip(Size size) => Path()
    ..lineTo(0.0, 310.0 + yOffset)
    ..quadraticBezierTo(
      size.width / 2,
      310.0 + yOffset,
      size.width,
      200.0 + yOffset,
    )
    ..lineTo(size.width, 0.0)
    ..close();

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
