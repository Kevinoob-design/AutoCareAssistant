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

class _NewCarBottomSheetState extends State<NewCarBottomSheet> {
  CarType? selectedCarType;
  PageController controller = PageController(initialPage: 0);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {};

  void onSelectedCarType(CarType carType) {
    setState(() {
      selectedCarType = carType;
    });
    controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onFormSaved() {
    formKey.currentState!.save();

    Car car = Car(
      id: 0,
      title: formData['title'],
      plaque: formData['plaque'],
      carType: selectedCarType!,
      make: formData['make'],
      model: formData['model'],
      year: formData['year'],
      chassisNumber: formData['chassisNumber'],
      distanceTraveled: formData['distanceTraveled'],
      distanceMeasurement: formData['distanceMeasurement'],
      lastServiceDate: DateTime(formData['lastServiceDate']),
    );

    print(car.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                physics: NeverScrollableScrollPhysics(),
                children: [CarTypeSelection(cb: onSelectedCarType), NewCarForm(formKey: formKey, formData: formData)],
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
