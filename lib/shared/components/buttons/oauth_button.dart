import 'package:auto_care_assistant/shared/config/constants.dart' show kBorderSideColor;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

class OauthSignupButton extends StatelessWidget {
  const OauthSignupButton({super.key, required this.icon, required this.press, required this.text});

  final String icon;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.transparent,
        minimumSize: const Size(double.infinity, 48),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(color: kBorderSideColor, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 6,
        children: [SvgPicture.asset(icon), Text(text)],
      ),
    );
  }
}
