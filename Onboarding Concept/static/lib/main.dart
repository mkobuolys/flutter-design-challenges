import 'package:flutter/material.dart';

import 'package:onboarding_concept_static/screens/onboarding/onboarding.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding Concept Static',
      home: Onboarding(),
    );
  }
}

void main() => runApp(App());
