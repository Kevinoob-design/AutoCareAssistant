import 'package:auto_care_assistant/screens/car_catalog/models/car.dart'
    show Car;
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(car.images),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(car.title, style: const TextStyle(fontSize: 16), maxLines: 2),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(
                text: "\$${car.plaque}",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFF7643),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
