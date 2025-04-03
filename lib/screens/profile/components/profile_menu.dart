import 'package:flutter/material.dart';
import 'package:auto_care_assistant/shared/config/constants.dart';
import 'package:flutter/services.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key, required this.text, this.leadingIcon, this.press, this.trailingIcon});

  final String text;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
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
        onPressed: () {
          HapticFeedback.lightImpact();
          press?.call();
        },
        child: Row(
          children: [
            Icon(leadingIcon, color: kPrimaryColor, size: 22),
            const SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(trailingIcon, color: kPrimaryColor, size: 22),
          ],
        ),
      ),
    );
  }
}
