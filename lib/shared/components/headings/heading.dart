import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 32, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
    );
  }
}
