import 'dart:math' as math;

import 'package:flutter/rendering.dart';

import '../../utils.dart';
import 'constants.dart';

class RotaryDialForegroundPainter extends CustomPainter {
  const RotaryDialForegroundPainter({
    required this.numberRadiusFromCenter,
    required this.startAngleOffset,
    required this.sweepAngle,
  });

  final double numberRadiusFromCenter;
  final double startAngleOffset;
  final double sweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    const firstDialNumberPosition = RotaryDialConstants.firstDialNumberPosition;
    const ringWidth = RotaryDialConstants.rotaryRingWidth;

    final angleOffset = startAngleOffset * firstDialNumberPosition;
    final paint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = ringWidth - RotaryDialConstants.rotaryRingPadding * 2
      ..style = PaintingStyle.stroke;

    canvas
      ..saveLayer(Rect.largest, paint)
      ..drawArc(
        Rect.fromCircle(
          center: size.centerOffset,
          radius: size.width / 2 - ringWidth / 2,
        ),
        angleOffset + firstDialNumberPosition,
        sweepAngle,
        false,
        paint,
      );

    for (int i = 0; i < 10; i++) {
      final offset = Offset.fromDirection(
        angleOffset + math.pi * (-30 - i * 30) / 180,
        numberRadiusFromCenter,
      );

      canvas.drawCircle(
        size.centerOffset + offset,
        RotaryDialConstants.dialNumberRadius,
        Paint()..blendMode = BlendMode.clear,
      );
    }

    canvas.drawCircle(
      size.centerOffset +
          Offset.fromDirection(math.pi / 6, numberRadiusFromCenter),
      ringWidth / 6,
      Paint()
        ..color = Color.fromRGBO(
          255,
          255,
          255,
          sweepAngle / RotaryDialConstants.maxRotaryRingSweepAngle,
        ),
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(RotaryDialForegroundPainter oldDelegate) =>
      oldDelegate.numberRadiusFromCenter != numberRadiusFromCenter &&
      oldDelegate.startAngleOffset != startAngleOffset &&
      oldDelegate.sweepAngle != sweepAngle;
}
