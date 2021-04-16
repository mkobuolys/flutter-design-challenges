import 'package:flutter/material.dart';

class FadeSlideTransition extends StatelessWidget {
  final Animation<double> animation;
  final double additionalOffset;
  final Widget child;

  const FadeSlideTransition({
    required this.animation,
    required this.additionalOffset,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, Widget? builderChild) {
        return Transform.translate(
          offset: Offset(
            0.0,
            (32.0 + additionalOffset) * (1 - animation.value),
          ),
          child: Opacity(
            opacity: animation.value,
            child: builderChild,
          ),
        );
      },
      child: child,
    );
  }
}
