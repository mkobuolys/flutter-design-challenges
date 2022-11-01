import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';

import '../../utils.dart';

const _passcodeDigitPadding = 8.0;
const _passcodeDigitSizeBig = 36.0;
const _passcodeDigitSizeSmall = 24.0;
const _passcodeDigitGapBig = 16.0;
const _passcodeDigitGapSmall = 4.0;

class PasscodeDigit {
  const PasscodeDigit({
    required this.backgroundColor,
    required this.fontColor,
    this.value,
  });

  final Color backgroundColor;
  final Color fontColor;
  final int? value;

  PasscodeDigit copyWith({
    Color? backgroundColor,
    Color? fontColor,
    int? value,
  }) =>
      PasscodeDigit(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        fontColor: fontColor ?? this.fontColor,
        value: value ?? this.value,
      );
}

class PasscodeDigits extends StatelessWidget {
  const PasscodeDigits({
    required this.animationDuration,
    required this.passcodeDigitValues,
    required this.simpleInputMode,
    super.key,
  });

  final Duration animationDuration;
  final List<PasscodeDigit> passcodeDigitValues;
  final bool simpleInputMode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _passcodeDigitSizeBig,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          for (var i = 0; i < passcodeDigitValues.length; i++)
            LocalHero(
              tag: 'passcode_digit_$i',
              child: _PasscodeDigitContainer(
                animationDuration: animationDuration,
                backgroundColor: passcodeDigitValues[i].backgroundColor,
                fontColor: passcodeDigitValues[i].fontColor,
                digit: passcodeDigitValues[i].value,
                size: simpleInputMode
                    ? _passcodeDigitSizeBig
                    : _passcodeDigitSizeSmall,
              ),
            ),
        ].addBetween(
          SizedBox(
            width:
                simpleInputMode ? _passcodeDigitGapBig : _passcodeDigitGapSmall,
          ),
        ),
      ),
    );
  }
}

class _PasscodeDigitContainer extends StatelessWidget {
  const _PasscodeDigitContainer({
    required this.animationDuration,
    required this.backgroundColor,
    required this.fontColor,
    required this.digit,
    required this.size,
  });

  final Duration animationDuration;
  final Color backgroundColor;
  final Color fontColor;
  final int? digit;
  final double size;

  @override
  Widget build(BuildContext context) {
    final digitContainerSize = size - _passcodeDigitPadding;
    final containerSize = digit != null ? digitContainerSize : 0.0;

    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: AnimatedContainer(
        height: containerSize,
        width: containerSize,
        duration: animationDuration,
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: digit != null
            ? Center(
                child: Text(
                  '$digit',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: fontColor,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                ),
              )
            : null,
      ),
    );
  }
}
