import 'package:flutter/material.dart';

class InputModeButton extends StatelessWidget {
  const InputModeButton({
    required this.animationDuration,
    required this.simpleInputMode,
    required this.onModeChanged,
    super.key,
  });

  final Duration animationDuration;
  final bool simpleInputMode;
  final VoidCallback onModeChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      alignment: Alignment.centerLeft,
      firstCurve: Curves.easeInOutCubic,
      secondCurve: Curves.easeInOutCubic,
      firstChild: _Button(label: 'Original', onTap: onModeChanged),
      secondChild: _Button(label: 'Simplify', onTap: onModeChanged),
      crossFadeState: simpleInputMode
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: animationDuration,
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label.toUpperCase(),
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
