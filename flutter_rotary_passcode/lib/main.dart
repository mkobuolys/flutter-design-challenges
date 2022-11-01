import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'passcode_input_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        textTheme: GoogleFonts.kanitTextTheme(),
      ),
      home: PasscodeInputView(
        expectedCode: '6942',
        onSuccess: () {
          // Handle valid passcode here
        },
        onError: () {
          // Handle invalid passcode here
        },
      ),
    );
  }
}
