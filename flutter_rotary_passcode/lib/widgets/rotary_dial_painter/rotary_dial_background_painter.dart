import 'dart:math' as math;

import 'package:flutter/rendering.dart';

import '../../utils.dart';
import 'constants.dart';

class RotaryDialBackgroundPainter extends CustomPainter {
  const RotaryDialBackgroundPainter({
    required this.opacity,
  });

  final double opacity;

  @override
  void paint(Canvas canvas, Size size) {
    const ringWidth = RotaryDialConstants.rotaryRingWidth;
    final paint = Paint()
      ..color = Color.fromRGBO(0, 0, 0, opacity)
      ..strokeWidth = ringWidth
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCircle(
        center: size.centerOffset,
        radius: size.width / 2 - ringWidth / 2,
      ),
      0,
      math.pi * 2.0,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(RotaryDialBackgroundPainter oldDelegate) =>
      oldDelegate.opacity != opacity;
}
