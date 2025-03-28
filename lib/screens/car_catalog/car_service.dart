import 'package:auto_care_assistant/screens/car_catalog/models/car.dart'
    show Car;

class CarService {
  static List<Car> getCars() {
    List<Car> demoCars = [
      Car(
        id: 1,
        images: "https://i.postimg.cc/c19zpJ6f/Image-Popular-Product-1.png",
        title: "Wireless Controller for PS4™",
        plaque: "KFW-5600",
        description: "my car 1",
      ),
      Car(
        id: 2,
        images: "https://i.postimg.cc/CxD6nH74/Image-Popular-Product-2.png",
        title: "Nike Sport White - Man Pant",
        plaque: "KFW-5600",
        description: "my car 2",
      ),
      Car(
        id: 3,
        images: "https://i.postimg.cc/1XjYwvbv/glap.png",
        title: "Gloves XC Omega - Polygon",
        plaque: "KFW-5600",
        description: "my car 3",
      ),
    ];

    return demoCars;
  }
}
