import 'package:flutter/material.dart';

import 'package:onboarding_concept_static/constants.dart';
import 'package:onboarding_concept_static/screens/login/login.dart';
import 'package:onboarding_concept_static/screens/onboarding/pages/community/index.dart';
import 'package:onboarding_concept_static/screens/onboarding/pages/education/index.dart';
import 'package:onboarding_concept_static/screens/onboarding/pages/onboarding_page.dart';
import 'package:onboarding_concept_static/screens/onboarding/pages/work/index.dart';
import 'package:onboarding_concept_static/screens/onboarding/widgets/header.dart';
import 'package:onboarding_concept_static/screens/onboarding/widgets/next_page_button.dart';
import 'package:onboarding_concept_static/screens/onboarding/widgets/onboarding_page_indicator.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentPage = 1;

  bool get isFirstPage => _currentPage == 1;

  Widget _getPage() {
    switch (_currentPage) {
      case 1:
        return OnboardingPage(
          number: 1,
          lightCardChild: CommunityLightCardContent(),
          darkCardChild: CommunityDarkCardContent(),
          textColumn: CommunityTextColumn(),
        );
      case 2:
        return OnboardingPage(
          number: 2,
          lightCardChild: EducationLightCardContent(),
          darkCardChild: EducationDarkCardContent(),
          textColumn: EducationTextColumn(),
        );
      case 3:
        return OnboardingPage(
          number: 3,
          lightCardChild: WorkLightCardContent(),
          darkCardChild: WorkDarkCardContent(),
          textColumn: WorkTextColumn(),
        );
      default:
        throw Exception("Page with number '$_currentPage' does not exist.");
    }
  }

  void _setNextPage(int nextPageNumber) {
    setState(() {
      _currentPage = nextPageNumber;
    });
  }

  void _nextPage() {
    switch (_currentPage) {
      case 1:
        _setNextPage(2);
        break;
      case 2:
        _setNextPage(3);
        break;
      case 3:
        _goToLogin();
        break;
    }
  }

  void _goToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kPaddingL),
          child: Column(
            children: <Widget>[
              Header(
                onSkip: _goToLogin,
              ),
              Expanded(
                child: _getPage(),
              ),
              OnboardingPageIndicator(
                currentPage: _currentPage,
                child: NextPageButton(
                  onPressed: _nextPage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
