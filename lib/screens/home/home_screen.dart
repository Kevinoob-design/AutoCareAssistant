import 'package:flutter/material.dart';

import 'package:auto_care_assistant/screens/home/components/my_cars_banner.dart';
import 'package:auto_care_assistant/screens/home/components/home_header.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(children: [HomeHeader(), MyCarsBanner()]),
        ),
      ),
    );
  }
}
