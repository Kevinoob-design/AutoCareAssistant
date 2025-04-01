import 'package:auto_care_assistant/screens/car_catalog/components/new_car_form.dart' show NewCarForm;
import 'package:auto_care_assistant/screens/car_catalog/models/car.dart' show Car;
import 'package:flutter/material.dart';

class CarEditScreen extends StatelessWidget {
  static String routeName = '/car-edit';

  CarEditScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {};

  @override
  Widget build(BuildContext context) {
    Car car = ModalRoute.of(context)!.settings.arguments as Car;

    void onFormSaved() async {
      if (formKey.currentState!.validate() == false) return;

      formKey.currentState!.save();

      Car updatedCar = Car(
        title: formData['title'],
        plaque: formData['plaque'],
        carType: formData['carType'],
        make: formData['make'],
        model: formData['model'],
        year: int.parse(formData['year']),
        chassisNumber: formData['chassisNumber'],
        distanceTraveled: int.parse(formData['distanceTraveled']),
        distanceMeasurement: formData['distanceMeasurement'],
        lastServiceDate: DateTime.parse(formData['lastServiceDate']),
      );

      Navigator.pop(context, updatedCar);
    }

    formData['title'] = car.title;
    formData['plaque'] = car.plaque;
    formData['carType'] = car.carType;
    formData['make'] = car.make;
    formData['model'] = car.model;
    formData['year'] = car.year.toString();
    formData['chassisNumber'] = car.chassisNumber;
    formData['distanceTraveled'] = car.distanceTraveled.toString();
    formData['distanceMeasurement'] = car.distanceMeasurement;
    formData['lastServiceDate'] = car.lastServiceDate.toLocal().toString().split(' ')[0];

    return Scaffold(
      appBar: AppBar(title: Text('Editing ${car.title}', style: TextStyle(overflow: TextOverflow.ellipsis))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NewCarForm(formKey: formKey, formData: formData, previousPageCb: null),
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
      ),
    );
  }
}
