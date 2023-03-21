import 'dart:math' as math;

import 'package:flutter/widgets.dart';

import '../dial_number.dart';
import 'constants.dart';
import 'rotary_dial_background_painter.dart';
import 'rotary_dial_foreground_painter.dart';

class RotaryDialInput extends StatelessWidget {
  const RotaryDialInput({
    required this.pagePadding,
    super.key,
  });

  final double pagePadding;

  @override
  Widget build(BuildContext context) {
    const inputValues = RotaryDialConstants.inputValues;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final size = Size(width, width);
        final dialNumberDistanceFromCenter = width / 2 -
            pagePadding -
            RotaryDialConstants.rotaryRingPadding * 2 -
            RotaryDialConstants.dialNumberPadding * 2;

        return Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: size,
              painter: const RotaryDialBackgroundPainter(),
            ),
            for (var i = 0; i < inputValues.length; i++)
              Transform.translate(
                offset: Offset.fromDirection(
                  (i + 1) * -math.pi / 6,
                  dialNumberDistanceFromCenter,
                ),
                child: DialNumber(number: inputValues[i]),
              ),
            CustomPaint(
              size: size,
              painter: RotaryDialForegroundPainter(
                numberRadiusFromCenter: dialNumberDistanceFromCenter,
              ),
            ),
          ],
        );
      },
    );
  }
}
