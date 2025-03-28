import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.image,
    this.height = 265,
    this.width = 235,
  });

  final String image;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: BoxFit.contain,
      height: height,
      width: width,
    );
  }
}
