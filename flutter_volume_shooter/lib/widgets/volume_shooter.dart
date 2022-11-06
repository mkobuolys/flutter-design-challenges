import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'volume_slider_painters/volume_slider_painters.dart';

const _iconSize = 96.0;

const _spaceWidth = 16.0;
const _xOffset = _spaceWidth + _iconSize;

const _sliderWidth = _iconSize * 0.06;
const _sliderThumbWidth = _sliderWidth * 1.5;

const _maxAngle = math.pi / 6;
const _maxAngleAnimationDurationInMilliseconds = 2000;

class VolumeShooter extends StatefulWidget {
  const VolumeShooter({
    required this.iconColor,
    required this.iconHoverColor,
    required this.sliderThumbColor,
    required this.onVolumeChanged,
    required this.sliderColor,
    super.key,
  });

  final Color iconColor;
  final Color iconHoverColor;
  final Color sliderColor;
  final Color sliderThumbColor;
  final ValueChanged<double> onVolumeChanged;

  @override
  State<VolumeShooter> createState() => _VolumeShooterState();
}

class _VolumeShooterState extends State<VolumeShooter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _iconAngleAnimation;
  late Animation<double> _sliderThumbAnimation;

  late final Stopwatch _stopwatch;
  Timer? _timer;

  late var _iconColor = widget.iconColor;

  var _thumbX = 0.0;
  var _thumbY = 0.0;

  var _volumeIconAngleRatio = 0.0;
  var _volumeIconFillRatio = 0.0;

  bool get _isAnimating => _controller.isAnimating;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _stopwatch = Stopwatch();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();

    super.dispose();
  }

  void _startAnimation() {
    if (_isAnimating) return;

    _reset(x: -_xOffset);

    _timer = Timer.periodic(const Duration(milliseconds: 16), _onTick);
    _stopwatch.start();
  }

  void _onTick(Timer timer) {
    if (!_stopwatch.isRunning) return;

    final elapsedTime = _stopwatch.elapsedMilliseconds;
    final value = elapsedTime <= _maxAngleAnimationDurationInMilliseconds
        ? elapsedTime / _maxAngleAnimationDurationInMilliseconds
        : 1.0;

    setState(() {
      _volumeIconFillRatio = value;
      _volumeIconAngleRatio = -value;
    });
  }

  void _endAnimation(double width) {
    if (_isAnimating) return;

    _stopwatch.stop();
    _timer?.cancel();

    final maxX = width * _volumeIconFillRatio;

    if (maxX - _xOffset < 0.0) {
      widget.onVolumeChanged(0.0);

      return _reset();
    }

    final vertexX = maxX / 2;
    final vertexY = math.tan(_volumeIconAngleRatio * _maxAngle) * vertexX;

    void setSliderThumbPosition() {
      final x = _sliderThumbAnimation.value - _xOffset;
      final a = -vertexY / math.pow(vertexX, 2);
      final y = a * math.pow(x - vertexX + _xOffset, 2) + vertexY;

      setState(() {
        _thumbX = x;
        _thumbY = y;
      });
    }

    void setVolumeIconAngle() => setState(
          () => _volumeIconAngleRatio = _iconAngleAnimation.value,
        );

    _sliderThumbAnimation = Tween<double>(
      begin: 0.0,
      end: maxX,
    ).animate(_controller)
      ..addListener(setSliderThumbPosition);

    _iconAngleAnimation = Tween<double>(
      begin: _volumeIconAngleRatio,
      end: 0.0,
    ).animate(_controller)
      ..addListener(setVolumeIconAngle);

    setState(() => _volumeIconFillRatio = 0.0);

    _controller.forward().whenComplete(() {
      _sliderThumbAnimation.removeListener(setSliderThumbPosition);
      _iconAngleAnimation.removeListener(setVolumeIconAngle);
      widget.onVolumeChanged(maxX / width * 100);
    });
  }

  void _reset({double x = 0.0, double y = 0.0}) {
    _controller.reset();
    _stopwatch.reset();

    setState(() {
      _volumeIconAngleRatio = 0.0;
      _volumeIconFillRatio = 0.0;
      _thumbX = x;
      _thumbY = y;
    });
  }

  void _onHover(PointerEnterEvent event) => setState(
        () => _iconColor = widget.iconHoverColor,
      );

  void _onHoverExit(PointerExitEvent event) => setState(
        () => _iconColor = widget.iconColor,
      );

  @override
  Widget build(BuildContext context) {
    final sliderThumbColor = widget.sliderThumbColor;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        return Row(
          children: [
            MouseRegion(
              onEnter: _onHover,
              onExit: _onHoverExit,
              child: GestureDetector(
                onTapDown: (_) => _startAnimation(),
                onTapUp: (_) => _endAnimation(width),
                onTapCancel: () => _endAnimation(width),
                child: Transform.rotate(
                  angle: _volumeIconAngleRatio * _maxAngle,
                  alignment: Alignment.centerLeft,
                  child: ShaderMask(
                    blendMode: BlendMode.srcATop,
                    shaderCallback: (rect) => RadialGradient(
                      colors: [sliderThumbColor, _iconColor],
                      center: Alignment.centerLeft,
                      radius: _volumeIconFillRatio,
                      stops: const [1.0, 1.0],
                      tileMode: TileMode.decal,
                    ).createShader(rect),
                    child: Icon(
                      Icons.volume_up,
                      size: _iconSize,
                      color: _iconColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: _spaceWidth),
            Expanded(
              child: CustomPaint(
                painter: VolumeSliderPainter(
                  color: widget.sliderColor,
                  width: _sliderWidth,
                ),
                foregroundPainter: VolumeSliderThumbPainter(
                  color: sliderThumbColor,
                  width: _sliderThumbWidth,
                  minimumOffsetX: -_spaceWidth,
                  x: _thumbX,
                  y: _thumbY,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
