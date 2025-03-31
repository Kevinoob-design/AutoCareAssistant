import 'package:auto_care_assistant/screens/car_catalog/models/car.dart' show Car;
import 'package:auto_care_assistant/shared/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

class CarCard extends StatelessWidget {
  const CarCard({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 12,
      children: [
        SizedBox(
          width: 95,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: const Color(0xFFF5F6F9), borderRadius: BorderRadius.circular(15)),
              child: SvgPicture.asset(car.carType.icon),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(car.title, style: const TextStyle(fontSize: 16), maxLines: 2),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(text: car.plaque, style: const TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor)),
            ),
          ],
        ),
        const Spacer(),
        IconButton(icon: Icon(Icons.edit), onPressed: () => Navigator.pushNamed(context, '/car-edit', arguments: car)),
      ],
    );
  }
}
