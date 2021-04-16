import 'package:flutter/material.dart';

import 'screens/onboarding/onboarding.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding Concept Static',
      home: Onboarding(),
    );
  }
}

void main() => runApp(App());
