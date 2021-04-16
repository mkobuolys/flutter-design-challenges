import 'package:flutter/material.dart';

import 'package:onboarding_concept_static/constants.dart';
import 'package:onboarding_concept_static/screens/login/widgets/custom_clippers/index.dart';
import 'package:onboarding_concept_static/screens/login/widgets/header.dart';
import 'package:onboarding_concept_static/screens/login/widgets/login_form.dart';

class Login extends StatefulWidget {
  const Login();

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kWhite,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: const WhiteTopClipper(),
            child: Container(color: kGrey),
          ),
          ClipPath(
            clipper: const GreyTopClipper(),
            child: Container(color: kBlue),
          ),
          ClipPath(
            clipper: const BlueTopClipper(),
            child: Container(color: kWhite),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kPaddingL),
              child: Column(
                children: const <Widget>[
                  Header(),
                  Spacer(),
                  LoginForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
