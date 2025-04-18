import 'package:auto_care_assistant/shared/components/buttons/oauth_button.dart' show OauthSignupButton;
import 'package:auto_care_assistant/shared/components/headings/subtitle.dart' show Subtitle;
import 'package:auto_care_assistant/shared/config/constants.dart' show kBorderSideColor;
import 'package:auto_care_assistant/screens/signup/components/signup_form.dart' show SignUpForm;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, GoogleAuthProvider;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_care_assistant/screens/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart' show GoogleSignIn, GoogleSignInAccount, GoogleSignInAuthentication;

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key, required this.controller});

  static const routeName = '/signup';
  final SignupController controller;

  @override
  Widget build(BuildContext context) {
    void goToHome() {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }

    void signInWithGoogle() async {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      goToHome();
    }

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.signUpTitle)),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Subtitle(text: AppLocalizations.of(context)!.signUpSubtitle),
                          Text(
                            AppLocalizations.of(context)!.signUpInstructions,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: kBorderSideColor),
                          ),
                        ],
                      ),
                    ),
                    const SignUpForm(),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Spacer(),
                    Text(AppLocalizations.of(context)!.signUpOrTextOption),
                    Spacer(),
                    Column(
                      spacing: 8,
                      children: [
                        OauthSignupButton(
                          icon: 'assets/icons/google-icon.svg',
                          text: AppLocalizations.of(context)!.continueWithGoogleTextButton,
                          press: signInWithGoogle,
                        ),
                        Text(
                          AppLocalizations.of(context)!.signUpDisclaimer,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: kBorderSideColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
