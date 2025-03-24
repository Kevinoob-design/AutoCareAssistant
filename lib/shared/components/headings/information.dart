import 'package:auto_care_assistant/shared/config/constants.dart'
    show borderSideColor;
import 'package:flutter/material.dart';

class InformationText extends StatelessWidget {
  const InformationText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: borderSideColor),
    );
  }
}
