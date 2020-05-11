import 'package:flutter/material.dart';

import 'package:onboarding_concept/screens/onboarding/onboarding.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding Concept',
      home: Builder(
        builder: (BuildContext context) {
          var screenHeight = MediaQuery.of(context).size.height;

          return Onboarding(
            screenHeight: screenHeight,
          );
        },
      ),
    );
  }
}

void main() => runApp(App());
