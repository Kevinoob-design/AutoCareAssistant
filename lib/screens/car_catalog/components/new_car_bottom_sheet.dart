import 'package:auto_care_assistant/screens/car_catalog/components/car_type_selection.dart' show CarTypeSelection;
import 'package:auto_care_assistant/screens/car_catalog/components/new_car_form.dart' show NewCarForm;
import 'package:auto_care_assistant/screens/car_catalog/models/car.dart' show Car;
import 'package:auto_care_assistant/screens/car_catalog/models/car_type.dart' show CarType;
import 'package:flutter/material.dart';

class NewCarBottomSheet extends StatefulWidget {
  const NewCarBottomSheet({super.key});

  @override
  State<NewCarBottomSheet> createState() => _NewCarBottomSheetState();
}

class _NewCarBottomSheetState extends State<NewCarBottomSheet> with SingleTickerProviderStateMixin {
  CarType? selectedCarType;
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {};

  void onSelectedCarType(CarType carType) async {
    setState(() {
      selectedCarType = carType;
    });
    await pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPreviousPage() async {
    setState(() {
      selectedCarType = null;
    });
    await pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onFormSaved() async {
    if (formKey.currentState!.validate() == false) return;

    formKey.currentState!.save();

    Car car = Car(
      title: formData['title'],
      plaque: formData['plaque'],
      carType: selectedCarType!,
      make: formData['make'],
      model: formData['model'],
      year: int.parse(formData['year']),
      chassisNumber: formData['chassisNumber'],
      distanceTraveled: int.parse(formData['distanceTraveled']),
      distanceMeasurement: formData['distanceMeasurement'],
      lastServiceDate: DateTime.parse(formData['lastServiceDate']),
    );

    Navigator.pop(context, car);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  CarTypeSelection(cb: onSelectedCarType),
                  NewCarForm(formKey: formKey, formData: formData, previousPageCb: onPreviousPage),
                ],
              ),
            ),
            if (selectedCarType != null)
              ElevatedButton(
                onPressed: onFormSaved,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: const Size(double.infinity, 48),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                ),
                child: const Text('Save'),
              ),
          ],
        ),
      ),
    );
  }
}
