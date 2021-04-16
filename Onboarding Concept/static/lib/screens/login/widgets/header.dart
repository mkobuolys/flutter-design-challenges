import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../widgets/logo.dart';

class Header extends StatelessWidget {
  const Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Logo(
            color: kBlue,
            size: 48.0,
          ),
          const SizedBox(height: kSpaceM),
          Text(
            'Welcome to Bubble',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: kBlack, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: kSpaceS),
          Text(
            'Est ad dolor aute ex commodo tempor exercitation proident.',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: kBlack.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
