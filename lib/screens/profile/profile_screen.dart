import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;

import 'components/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ProfileMenu(text: "My Account", icon: "assets/icons/User Icon.svg", press: () => {}),
            ProfileMenu(text: "Notifications", icon: "assets/icons/Bell.svg", press: () {}),
            ProfileMenu(text: "Settings", icon: "assets/icons/Settings.svg", press: () => Navigator.pushNamed(context, '/settings')),
            ProfileMenu(text: "Help Center", icon: "assets/icons/Question mark.svg", press: () {}),
            ProfileMenu(text: "Log Out", icon: "assets/icons/Log out.svg", press: () => FirebaseAuth.instance.signOut()),
            ProfileMenu(
              text: "Reset Defaults",
              icon: "assets/icons/Log out.svg",
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
