import 'package:flutter/widgets.dart';

import '../dial_number.dart';
import '../rotary_dial_painter/constants.dart';

class PasscodeInput extends StatelessWidget {
  const PasscodeInput({super.key});

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
              for (var j = 0; j < 3; j++)
                DialNumber(number: RotaryDialConstants.inputValues[i * 3 + j])
            ],
          ),
        DialNumber(number: RotaryDialConstants.inputValues[9])
      ],
    );
  }
}
