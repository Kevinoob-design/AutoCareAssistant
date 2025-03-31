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

    formData['title'] = car.title;
    formData['plaque'] = car.plaque;
    formData['carType'] = car.carType.type;
    formData['make'] = car.make;
    formData['model'] = car.model;
    formData['year'] = car.year.toString();
    formData['chassisNumber'] = car.chassisNumber;
    formData['distanceTraveled'] = car.distanceTraveled.toString();
    formData['distanceMeasurement'] = car.distanceMeasurement;
    formData['lastServiceDate'] = car.lastServiceDate.toLocal().toString().split(' ')[0];

    return Scaffold(
      appBar: AppBar(title: Text('Editing ${car.title}', style: TextStyle(overflow: TextOverflow.ellipsis))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: NewCarForm(formKey: formKey, formData: formData, previousPageCb: null),
      ),
    );
  }
}
