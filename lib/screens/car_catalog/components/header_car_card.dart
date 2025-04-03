import 'package:auto_care_assistant/screens/car_catalog/models/car.dart' show Car;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:intl/intl.dart' show NumberFormat;

class HeaderCarCard extends StatelessWidget {
  const HeaderCarCard({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        SizedBox(
          width: 65,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: const Color(0xFFF5F6F9), borderRadius: BorderRadius.circular(15)),
              child: SvgPicture.asset(car.carType.icon),
            ),
          ),
        ),
        Expanded(
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                car.title,
                style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${NumberFormat.decimalPattern('en').format(car.distanceTraveled)} ${car.distanceMeasurement.name}',
                style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.lastServiceLabel,
                style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                car.lastServiceDate.toLocal().toString().split(' ')[0],
                style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
