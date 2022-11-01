import 'package:flutter/widgets.dart';

import '../dial_number.dart';
import '../rotary_dial_painter/constants.dart';

class PasscodeInput extends StatelessWidget {
  const PasscodeInput({
    required this.onDigitSelected,
    super.key,
  });

  final ValueSetter<int> onDigitSelected;

  Widget _renderDialNumber(int index) => GestureDetector(
        onTap: () => onDigitSelected(index),
        child: DialNumber(number: RotaryDialConstants.inputValues[index]),
      );

  @override
  Widget build(BuildContext context) {
    const alignment = MainAxisAlignment.spaceEvenly;

    return Column(
      mainAxisAlignment: alignment,
      children: [
        for (var i = 0; i < 3; i++)
          Row(
            mainAxisAlignment: alignment,
            children: [
              for (var j = 0; j < 3; j++) _renderDialNumber(i * 3 + j),
            ],
          ),
        _renderDialNumber(9),
      ],
    );
  }
}
