import 'package:auto_care_assistant/screens/car_catalog/models/car.dart' show Car, DistanceMeasurement;
import 'package:auto_care_assistant/screens/car_catalog/models/car_type.dart' show CarType;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CarService {
  static final List<CarType> carTypes = [
    CarType(type: 'Sedan', icon: 'assets/icons/Sedan.svg'),
    CarType(type: 'City Car', icon: 'assets/icons/Mini.svg'),
    CarType(type: 'SUV', icon: 'assets/icons/SUV.svg'),
    CarType(type: 'Minivan', icon: 'assets/icons/Minivan.svg'),
    CarType(type: 'Wagon', icon: 'assets/icons/Wagon.svg'),
    CarType(type: 'Coupe', icon: 'assets/icons/Coupe.svg'),
    CarType(type: 'Pickup Truck', icon: 'assets/icons/Pickup Truck.svg'),
    CarType(type: 'Hatchback', icon: 'assets/icons/Hatchback.svg'),
    CarType(type: 'Convertible', icon: 'assets/icons/Convertible.svg'),
    CarType(type: 'Sport', icon: 'assets/icons/Sport.svg'),
    // CarType(type: 'Police', icon: 'assets/icons/Police.svg'),
    // CarType(type: 'Taxi', icon: 'assets/icons/Taxi.svg'),
  ];

  static Future<int> getCarsCount() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    return db
        .collection('cars')
        .where('uid', isEqualTo: auth.currentUser!.uid)
        .count()
        .get()
        .then((res) => res.count ?? 0);
  }

  static void saveCar(Car car) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    await db.collection('cars').add({
      'uid': auth.currentUser!.uid,
      'title': car.title,
      'plaque': car.plaque,
      'carType': {'type': car.carType.type, 'icon': car.carType.icon},
      'make': car.make,
      'model': car.model,
      'year': car.year,
      'chassisNumber': car.chassisNumber,
      'distanceTraveled': car.distanceTraveled,
      'distanceMeasurement': car.distanceMeasurement.toString(),
      'lastServiceDate': car.lastServiceDate,
    });
  }

  static List<CarType> getCarTypes() {
    return carTypes;
  }

  static Future deleteById(String id) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    return db.collection('cars').doc(id).delete();
  }

  static Car deserializeCar(Map<String, dynamic> data) {
    return Car(
      title: data['title'],
      plaque: data['plaque'],
      carType: CarType(type: data['carType']['type'], icon: data['carType']['icon']),
      make: data['make'],
      model: data['model'],
      year: data['year'],
      chassisNumber: data['chassisNumber'],
      distanceTraveled: data['distanceTraveled'],
      distanceMeasurement: DistanceMeasurement.values.byName(data['distanceMeasurement'].split('.').last as String),
      lastServiceDate: data['lastServiceDate'].toDate(),
    );
  }
}
