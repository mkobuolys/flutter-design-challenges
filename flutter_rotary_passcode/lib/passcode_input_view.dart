import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

const _padding = 16.0;

class PasscodeInputView extends StatefulWidget {
  const PasscodeInputView({
    required this.expectedCode,
    super.key,
  });

  final String expectedCode;

  @override
  State<PasscodeInputView> createState() => _PasscodeInputViewState();
}

class _PasscodeInputViewState extends State<PasscodeInputView> {
  late final List<PasscodeDigit> _passcodeDigitValues;

  var _simpleInputMode = false;

  @override
  void initState() {
    super.initState();

    _passcodeDigitValues = List.generate(
      widget.expectedCode.length,
      (index) => const PasscodeDigit(
        backgroundColor: Colors.white,
        fontColor: Colors.white,
      ),
      growable: false,
    );
  }

  void _onModeChanged() => setState(() => _simpleInputMode = !_simpleInputMode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            _padding,
            _padding * 3,
            _padding,
            _padding * 2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter\npasscode'.toUpperCase(),
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 32.0),
              Align(
                alignment:
                    _simpleInputMode ? Alignment.center : Alignment.centerRight,
                child: PasscodeDigits(
                  passcodeDigitValues: _passcodeDigitValues,
                  simpleInputMode: _simpleInputMode,
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: _simpleInputMode
                    ? const PasscodeInput()
                    : const RotaryDialInput(pagePadding: _padding),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InputModeButton(
                  simpleInputMode: _simpleInputMode,
                  onModeChanged: _onModeChanged,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
