import 'package:auto_care_assistant/screens/car_catalog/car_service.dart' show CarService;
import 'package:auto_care_assistant/screens/car_catalog/components/header_car_card.dart' show HeaderCarCard;
import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show Intl;

class MyCarsBanner extends StatefulWidget {
  const MyCarsBanner({super.key});

  @override
  State<MyCarsBanner> createState() => _MyCarsBannerState();
}

class _MyCarsBannerState extends State<MyCarsBanner> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  int carsCount = 0;

  @override
  void initState() {
    super.initState();
    CarService.getCarsCount().then((value) => setState(() => carsCount = value));
  }

  void refreshCount(dynamic val) {
    CarService.getCarsCount().then((value) => setState(() => carsCount = value));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
          spacing: 20,
          children: [
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance
                      .collection('cars')
                      .where('uid', isEqualTo: auth.currentUser!.uid)
                      .limit(1)
                      .snapshots(),
              builder: (context, snapshot) {
                return snapshot.data?.docs.isEmpty ?? true
                    ? Text('You haven\'t added any cars', style: TextStyle(color: Colors.white, fontSize: 18))
                    : HeaderCarCard(
                      car: CarService.deserializeCar(snapshot.data?.docs[0].data() as Map<String, dynamic>),
                    );
              },
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/my-cars').then(refreshCount),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
              ),
              child: Text(
                carsCount > 0
                    ? '$carsCount ${Intl.plural(carsCount, one: 'car', other: 'cars')} registered - View all'
                    : 'Manage to my cars',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
