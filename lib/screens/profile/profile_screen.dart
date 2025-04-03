import 'package:auto_care_assistant/shared/components/notification/show_notification_banner.dart';
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
              leadingIcon: CupertinoIcons.person_fill,
              trailingIcon: CupertinoIcons.chevron_right,
              press: () => {},
            ),
            ProfileMenu(
              text: AppLocalizations.of(context)!.profileNotificationsLabel,
              leadingIcon: CupertinoIcons.bell_solid,
              trailingIcon: CupertinoIcons.chevron_right,
              press: () {},
            ),
            ProfileMenu(
              text: AppLocalizations.of(context)!.profileSettingsLabel,
              leadingIcon: CupertinoIcons.gear_solid,
              trailingIcon: CupertinoIcons.chevron_right,
              press: () => Navigator.pushNamed(context, '/settings'),
            ),
            ProfileMenu(
              text: AppLocalizations.of(context)!.profileHelpCenterLabel,
              leadingIcon: CupertinoIcons.question_circle_fill,
              trailingIcon: CupertinoIcons.chevron_right,
              press: () {},
            ),
            ProfileMenu(
              text: AppLocalizations.of(context)!.profileLogOutLabel,
              leadingIcon: CupertinoIcons.arrow_left_square_fill,
              trailingIcon: CupertinoIcons.chevron_right,
              press: () => FirebaseAuth.instance.signOut(),
            ),
            ProfileMenu(
              text: AppLocalizations.of(context)!.profileResetDefaultsLabel,
              leadingIcon: CupertinoIcons.restart,
              press: () async {
                final SharedPreferences preferences = await SharedPreferences.getInstance();
                await preferences.setBool('skipSplashScreen', false);

                if (!context.mounted) return;

                showFloatingBanner(context, AppLocalizations.of(context)!.notificationBannerRestoreDefaultsMessage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
