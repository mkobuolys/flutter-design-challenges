import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'custom_button.dart';
import 'custom_input_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm();

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final space = height > 650 ? kSpaceM : kSpaceS;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Column(
        children: <Widget>[
          const CustomInputField(
            label: 'Username or Email',
            prefixIcon: Icons.person,
            obscureText: true,
          ),
          SizedBox(height: space),
          const CustomInputField(
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
            image: const Image(
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
