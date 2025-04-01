import 'package:auto_care_assistant/screens/car_catalog/car_service.dart' show CarService;
import 'package:auto_care_assistant/screens/car_catalog/components/car_type_card.dart' show CarTypeCard;
import 'package:auto_care_assistant/screens/car_catalog/models/car_type.dart' show CarType;
import 'package:auto_care_assistant/shared/components/headings/subtitle.dart';
import 'package:flutter/material.dart';

class CarTypeSelection extends StatelessWidget {
  const CarTypeSelection({super.key, required this.cb});

  final Function(CarType carType) cb;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Subtitle(text: 'Select vehicle type'),
        Expanded(
          child: ListView.builder(
            itemCount: CarService.getCarTypes().length,
            itemBuilder:
                (context, index) => InkWell(
                  onTap: () => cb(CarService.getCarTypes()[index]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CarTypeCard(carType: CarService.getCarTypes()[index]),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
