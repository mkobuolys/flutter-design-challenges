import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:onboarding_concept/constants.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final double angle;
  final int currentPage;
  final Widget child;

  const OnboardingPageIndicator({
    @required this.angle,
    @required this.currentPage,
    @required this.child,
  })  : assert(angle != null),
        assert(currentPage != null),
        assert(child != null);

  Color _getPageIndicatorColor(int pageIndex) {
    return currentPage > pageIndex ? kWhite : kWhite.withOpacity(0.25);
  }

  double get indicatorGap => pi / 12;
  double get indicatorLength => pi / 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: _OnboardignPageIndicatorPainter(
          color: _getPageIndicatorColor(0),
          startAngle:
              (4 * indicatorLength) - (indicatorLength + indicatorGap) + angle,
          indicatorLength: indicatorLength,
        ),
        child: CustomPaint(
          painter: _OnboardignPageIndicatorPainter(
            color: _getPageIndicatorColor(1),
            startAngle: 4 * indicatorLength + angle,
            indicatorLength: indicatorLength,
          ),
          child: CustomPaint(
            painter: _OnboardignPageIndicatorPainter(
              color: _getPageIndicatorColor(2),
              startAngle: (4 * indicatorLength) +
                  (indicatorLength + indicatorGap) +
                  angle,
              indicatorLength: indicatorLength,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _OnboardignPageIndicatorPainter extends CustomPainter {
  final Color color;
  final double startAngle;
  final double indicatorLength;

  const _OnboardignPageIndicatorPainter({
    @required this.color,
    @required this.startAngle,
    @required this.indicatorLength,
  })  : assert(color != null),
        assert(startAngle != null),
        assert(indicatorLength != null);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: (size.shortestSide + 12.0) / 2,
      ),
      startAngle,
      indicatorLength,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_OnboardignPageIndicatorPainter oldDelegate) {
    return this.color != oldDelegate.color ||
        this.startAngle != oldDelegate.startAngle;
  }
}
