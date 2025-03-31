import 'package:auto_care_assistant/screens/car_catalog/models/car_type.dart' show CarType;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

class CarTypeCard extends StatelessWidget {
  const CarTypeCard({super.key, required this.carType});

  final CarType carType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 65,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: const Color(0xFFF5F6F9), borderRadius: BorderRadius.circular(15)),
              child: SvgPicture.asset(carType.icon),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(carType.type, style: const TextStyle(fontSize: 16), maxLines: 2)],
        ),
      ],
    );
  }
}
