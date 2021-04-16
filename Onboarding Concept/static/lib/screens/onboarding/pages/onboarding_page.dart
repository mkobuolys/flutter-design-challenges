import 'package:flutter/material.dart';

import '../widgets/cards_stack.dart';

class OnboardingPage extends StatelessWidget {
  final int number;
  final Widget lightCardChild;
  final Widget darkCardChild;
  final Widget textColumn;

  const OnboardingPage({
    required this.number,
    required this.lightCardChild,
    required this.darkCardChild,
    required this.textColumn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CardsStack(
          pageNumber: number,
          lightCardChild: lightCardChild,
          darkCardChild: darkCardChild,
        ),
        SizedBox(height: number % 2 == 1 ? 50.0 : 25.0),
        textColumn,
      ],
    );
  }
}
