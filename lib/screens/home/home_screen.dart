import 'package:auto_care_assistant/screens/home/components/car_charts.dart';
import 'package:auto_care_assistant/screens/home/components/promotions_carousel.dart' show PromotionCarousel;
import 'package:flutter/material.dart';

import 'package:auto_care_assistant/screens/home/components/my_cars_banner.dart';
import 'package:auto_care_assistant/screens/home/components/home_header.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [HomeHeader(), MyCarsBanner(), PromotionCarousel(), LineChartSample2()]),
        ),
      ),
    );
  }
}
