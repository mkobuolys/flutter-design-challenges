import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';

import 'rotary_dial_painter/constants.dart';

const _dialNumberRadius = RotaryDialConstants.rotaryRingWidth / 2 -
    (RotaryDialConstants.rotaryRingPadding +
        RotaryDialConstants.dialNumberPadding);

class DialNumber extends StatelessWidget {
  const DialNumber({
    required this.number,
    super.key,
  });

  final int number;

  @override
  Widget build(BuildContext context) {
    return LocalHero(
      tag: 'digit_$number',
      child: Container(
        height: _dialNumberRadius * 2,
        width: _dialNumberRadius * 2,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: Text(
          '$number',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
