import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

class OauthSignupButton extends StatelessWidget {
  const OauthSignupButton({super.key, required this.icon, required this.press});

  final String icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 56,
        width: 56,
        decoration: const BoxDecoration(color: Color(0xFFF5F6F9), shape: BoxShape.circle),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
