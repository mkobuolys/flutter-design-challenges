import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BlueTopClipper extends CustomClipper<Path> {
  final double yOffset;

  const BlueTopClipper({
    @required this.yOffset,
  }) : assert(yOffset != null);

  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, 220.0 + yOffset)
      ..quadraticBezierTo(
        size.width / 2.2,
        260.0 + yOffset,
        size.width,
        170.0 + yOffset,
      )
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
