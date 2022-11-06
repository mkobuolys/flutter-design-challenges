import 'package:flutter/rendering.dart';

class VolumeSliderThumbPainter extends CustomPainter {
  const VolumeSliderThumbPainter({
    required this.color,
    required this.width,
    required this.minimumOffsetX,
    required this.x,
    required this.y,
  });

  final Color color;
  final double width;
  final double minimumOffsetX;
  final double x;
  final double y;

  @override
  void paint(Canvas canvas, Size size) {
    if (x < minimumOffsetX) return;

    final paint = Paint()..color = color;

    canvas.drawCircle(Offset(x, y), width, paint);
  }

  @override
  bool shouldRepaint(VolumeSliderThumbPainter oldDelegate) =>
      oldDelegate.x != x || oldDelegate.y != y;
}
