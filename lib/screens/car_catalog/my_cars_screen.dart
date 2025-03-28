import 'package:auto_care_assistant/screens/car_catalog/car_service.dart'
    show CarService;
import 'package:auto_care_assistant/screens/car_catalog/components/bottom_add_car.dart'
    show BottomNavBarAddCar;
import 'package:auto_care_assistant/screens/car_catalog/components/car_card.dart'
    show CarCard;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCarsScreen extends StatefulWidget {
  const MyCarsScreen({super.key});

  static String routeName = "/my-cars";

  @override
  State<MyCarsScreen> createState() => _MyCarsScreenState();
}

class _MyCarsScreenState extends State<MyCarsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text("Your Cars"),
            Text(
              "${CarService.getCars().length} cars",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: CarService.getCars().length,
          itemBuilder:
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(CarService.getCars()[index].id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      CarService.getCars().removeAt(index);
                    });
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        SvgPicture.asset("assets/icons/Trash-icon.svg"),
                      ],
                    ),
                  ),
                  child: CarCard(car: CarService.getCars()[index]),
                ),
              ),
        ),
      ),
      bottomNavigationBar: const BottomNavBarAddCar(),
    );
  }
}
