import 'package:flutter/material.dart';
import 'package:auto_care_assistant/shared/config/constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key, required this.text, required this.icon, this.press});

  final String text;
  final IconData icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: kPrimaryColor,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(icon, color: kPrimaryColor, size: 22),
            const SizedBox(width: 20),
            Expanded(child: Text(text)),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
