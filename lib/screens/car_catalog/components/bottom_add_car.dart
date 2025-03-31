import 'package:auto_care_assistant/screens/car_catalog/car_service.dart' show CarService;
import 'package:auto_care_assistant/screens/car_catalog/components/new_car_bottom_sheet.dart' show NewCarBottomSheet;
import 'package:auto_care_assistant/screens/car_catalog/models/car.dart' show Car;
import 'package:flutter/material.dart';

class BottomNavBarAddCar extends StatelessWidget {
  const BottomNavBarAddCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  Car? car = await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useSafeArea: true,
                    showDragHandle: true,
                    builder: (context) => NewCarBottomSheet(),
                  );

                  if (car is Car) CarService.saveCar(car);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                ),
                child: const Text('Register a new Car'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
