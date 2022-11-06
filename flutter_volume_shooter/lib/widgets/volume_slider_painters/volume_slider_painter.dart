import 'package:flutter/rendering.dart';

class VolumeSliderPainter extends CustomPainter {
  const VolumeSliderPainter({
    required this.color,
    required this.width,
  });

  final Color color;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = width;

    canvas.drawLine(
      Offset(0.0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(VolumeSliderPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.width != width;
}
