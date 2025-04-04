import 'package:auto_care_assistant/shared/components/salomon_bottom_bar.dart'
    show SalomonBottomBar, SalomonBottomBarItem;
import 'package:auto_care_assistant/shared/config/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_care_assistant/screens/home/home_screen.dart';
import 'package:auto_care_assistant/screens/profile/profile_screen.dart';
import 'package:flutter/services.dart' show HapticFeedback;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  static String routeName = '/';

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int currentSelectedIndex = 0;

  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  final pages = [const HomeScreen(), const ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentSelectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => {HapticFeedback.lightImpact(), Navigator.pushNamed(context, '/program-service')},
        backgroundColor: kPrimaryColor,
        child: const Icon(CupertinoIcons.add),
      ),
      bottomNavigationBar: SalomonBottomBar(
        onTap: updateCurrentIndex,
        currentIndex: currentSelectedIndex,
        items: [
          SalomonBottomBarItem(
            icon: Icon(CupertinoIcons.house),
            activeIcon: Icon(CupertinoIcons.house_fill),
            title: Text(AppLocalizations.of(context)!.navHomeLabel),
          ),
          SalomonBottomBarItem(
            icon: Icon(CupertinoIcons.person),
            activeIcon: Icon(CupertinoIcons.person_fill),
            title: Text(AppLocalizations.of(context)!.navProfileLabel),
          ),
        ],
      ),
    );
  }
}
