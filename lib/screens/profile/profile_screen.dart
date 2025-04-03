import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_care_assistant/screens/profile/components/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.profileTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ProfileMenu(
              text: AppLocalizations.of(context)!.profileMyAccountLabel,
              icon: CupertinoIcons.person_fill,
              press: () => {},
            ),
            ProfileMenu(
              text: AppLocalizations.of(context)!.profileNotificationsLabel,
              icon: CupertinoIcons.bell_solid,
              press: () {},
            ),
            ProfileMenu(
              text: AppLocalizations.of(context)!.profileSettingsLabel,
              icon: CupertinoIcons.gear_solid,
              press: () => Navigator.pushNamed(context, '/settings'),
            ),
            ProfileMenu(
              text: AppLocalizations.of(context)!.profileHelpCenterLabel,
              icon: CupertinoIcons.question_circle_fill,
              press: () {},
            ),
            ProfileMenu(
              text: AppLocalizations.of(context)!.profileLogOutLabel,
              icon: CupertinoIcons.arrow_left_square_fill,
              press: () => FirebaseAuth.instance.signOut(),
            ),
            ProfileMenu(
              text: AppLocalizations.of(context)!.profileResetDefaultsLabel,
              icon: CupertinoIcons.restart,
              press: () async {
                final SharedPreferences preferences = await SharedPreferences.getInstance();
                await preferences.setBool('skipSplashScreen', false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
