import 'package:auto_care_assistant/screens/car_catalog/models/car.dart' show Car, DistanceMeasurement;
import 'package:auto_care_assistant/screens/car_catalog/models/car_type.dart' show CarType;

class CarService {
  static List<Car> demoCars = [
    Car(
      id: 1,
      carType: CarType(type: 'Sedan', icon: 'assets/icons/Sedan.svg'),
      title: 'Primary Car',
      plaque: 'ABC123',
      chassisNumber: '123456789',
      distanceTraveled: '12.5',
      make: 'Honda',
      model: 'Civic',
      year: '2020',
      distanceMeasurement: DistanceMeasurement.km,
      lastServiceDate: DateTime.now(),
    ),
  ];

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

  static List<Car> getCars() {
    return demoCars;
  }

  static List<CarType> getCarTypes() {
    return carTypes;
  }

  static void removeAt(index) {
    demoCars.removeAt(index);
  }
}
