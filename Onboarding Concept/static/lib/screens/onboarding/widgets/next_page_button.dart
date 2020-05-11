import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:onboarding_concept_static/constants.dart';

class NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextPageButton({
    @required this.onPressed,
  }) : assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(kPaddingM),
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: kWhite,
      child: Icon(
        Icons.arrow_forward,
        color: kBlue,
        size: 32.0,
      ),
      onPressed: onPressed,
    );
  }
}
