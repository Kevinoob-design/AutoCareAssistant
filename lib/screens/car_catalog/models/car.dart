import 'package:auto_care_assistant/screens/car_catalog/models/car_type.dart' show CarType;

enum DistanceMeasurement { km, mi }

class Car {
  final String title;
  final CarType carType;
  final String plaque;
  final String chassisNumber;
  final int distanceTraveled;
  final String make;
  final String model;
  final int year;
  final DistanceMeasurement distanceMeasurement;
  final DateTime lastServiceDate;

  Car({
    required this.chassisNumber,
    required this.distanceTraveled,
    required this.make,
    required this.model,
    required this.year,
    required this.distanceMeasurement,
    required this.lastServiceDate,
    required this.carType,
    required this.title,
    required this.plaque,
  });
}
