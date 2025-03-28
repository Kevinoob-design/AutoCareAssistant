import 'package:auto_care_assistant/shared/components/salomon_bottom_bar.dart'
    show SalomonBottomBar, SalomonBottomBarItem;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_care_assistant/shared/config/constants.dart';
import 'package:auto_care_assistant/screens/home/home_screen.dart';
import 'package:auto_care_assistant/screens/profile/profile_screen.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  static String routeName = "/";

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
      bottomNavigationBar: SalomonBottomBar(
        onTap: updateCurrentIndex,
        currentIndex: currentSelectedIndex,
        items: [
          SalomonBottomBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              colorFilter: const ColorFilter.mode(
                kPrimaryColor,
                BlendMode.srcIn,
              ),
            ),
            title: Text("Home"),
          ),
          SalomonBottomBarItem(
            icon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              colorFilter: const ColorFilter.mode(
                kPrimaryColor,
                BlendMode.srcIn,
              ),
            ),
            title: Text("Profile"),
          ),
        ],
      ),
    );
  }
}
