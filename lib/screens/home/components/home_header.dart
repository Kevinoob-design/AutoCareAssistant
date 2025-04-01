import 'package:flutter/material.dart';
import 'package:auto_care_assistant/screens/home/components/icon_btn_with_counter.dart';
import 'package:auto_care_assistant/screens/home/components/search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: SearchField()),
          const SizedBox(width: 16),
          IconBtnWithCounter(svgSrc: 'assets/icons/Bell.svg', numOfitem: 3, press: () {}),
        ],
      ),
    );
  }
}
