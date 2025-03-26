import 'package:flutter/material.dart';

import 'components/my_cars_banner.dart';
import 'components/home_header.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

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
