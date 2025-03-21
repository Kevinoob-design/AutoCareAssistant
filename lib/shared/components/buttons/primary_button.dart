import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.text, required this.cb});

  final String text;
  final VoidCallback cb;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: cb,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: const Color(0xFFFF7643),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
      child: Text(text),
    );
  }
}
