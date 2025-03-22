import 'package:auto_care_assistant/shared/components/buttons/oauth_button.dart'
    show OauthSignupButton;
import 'package:auto_care_assistant/shared/components/headings/subtitle.dart'
    show Subtitle;
import 'package:auto_care_assistant/shared/config/constants.dart'
    show borderSideColor;
import 'package:auto_care_assistant/signup/components/form.dart'
    show SignUpForm;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_care_assistant/signup/signup_controller.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key, required this.controller});

  static const routeName = '/signup';
  final SignupController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Subtitle(text: AppLocalizations.of(context)!.signUpSubtitle),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)!.signUpInstructions,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: borderSideColor),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.20),
                  const SignUpForm(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  Text(AppLocalizations.of(context)!.signUpOrTextOption),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  OauthSignupButton(
                    icon: 'assets/svgs/google.svg',
                    text:
                        AppLocalizations.of(
                          context,
                        )!.continueWithGoogleTextButton,
                    press: () {},
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)!.signUpDisclaimer,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: borderSideColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
