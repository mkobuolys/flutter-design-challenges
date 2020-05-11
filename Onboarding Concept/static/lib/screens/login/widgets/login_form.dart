import 'package:flutter/material.dart';

import 'package:onboarding_concept_static/constants.dart';
import 'package:onboarding_concept_static/screens/login/widgets/custom_button.dart';
import 'package:onboarding_concept_static/screens/login/widgets/custom_input_field.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? kSpaceM : kSpaceS;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Column(
        children: <Widget>[
          CustomInputField(
            label: 'Username or Email',
            prefixIcon: Icons.person,
            obscureText: true,
          ),
          SizedBox(height: space),
          CustomInputField(
            label: 'Password',
            prefixIcon: Icons.lock,
            obscureText: true,
          ),
          SizedBox(height: space),
          CustomButton(
            color: kBlue,
            textColor: kWhite,
            text: 'Login to continue',
            onPressed: () {},
          ),
          SizedBox(height: 2 * space),
          CustomButton(
            color: kWhite,
            textColor: kBlack.withOpacity(0.5),
            text: 'Continue with Google',
            image: Image(
              image: AssetImage(kGoogleLogoPath),
              height: 48.0,
            ),
            onPressed: () {},
          ),
          SizedBox(height: space),
          CustomButton(
            color: kBlack,
            textColor: kWhite,
            text: 'Create a Bubble Account',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
