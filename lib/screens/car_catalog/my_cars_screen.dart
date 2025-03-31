import 'package:auto_care_assistant/screens/car_catalog/car_service.dart' show CarService;
import 'package:auto_care_assistant/screens/car_catalog/components/bottom_add_car.dart' show BottomNavBarAddCar;
import 'package:auto_care_assistant/screens/car_catalog/components/car_card.dart' show CarCard;
import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore, QuerySnapshot;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCarsScreen extends StatefulWidget {
  const MyCarsScreen({super.key});

  static String routeName = '/my-cars';

  @override
  State<MyCarsScreen> createState() => _MyCarsScreenState();
}

class _MyCarsScreenState extends State<MyCarsScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('cars').where('uid', isEqualTo: auth.currentUser!.uid).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final int length = snapshot.data!.docs.length;

        return Scaffold(
          appBar: AppBar(
            title: Column(
              children: [
                const Text('Your Cars'),
                Text('$length car${length == 1 ? "" : "s"}', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          body: snapshot.data!.docs.isNotEmpty ? getMyCarsList(snapshot, length) : RegisterNewCarMessage(),
          bottomNavigationBar: const BottomNavBarAddCar(),
        );
      },
    );
  }

  Widget getMyCarsList(AsyncSnapshot<QuerySnapshot<Object?>> snapshot, int length) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: length,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                key: Key(snapshot.data!.docs[index].id),
                dismissThresholds: const {DismissDirection.endToStart: 0.15},
                direction: DismissDirection.endToStart,
                confirmDismiss: (DismissDirection direction) async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirm'),
                        content: const Text('Are you sure you wish to delete this item?'),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                            child: const Text('DELETE'),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('CANCEL'),
                          ),
                        ],
                      );
                    },
                  );
                },
                onDismissed: (direction) async {
                  await CarService.deleteById(snapshot.data?.docs[index].id as String);
                  setState(() {});
                },
                background: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(color: const Color(0xFFFFE6E6), borderRadius: BorderRadius.circular(15)),
                  child: Row(children: [const Spacer(), SvgPicture.asset('assets/icons/Trash-icon.svg')]),
                ),
                child: CarCard(
                  car: CarService.deserializeCar(snapshot.data?.docs[index].data() as Map<String, dynamic>),
                ),
              ),
            ),
      ),
    );
  }
}

class RegisterNewCarMessage extends StatelessWidget {
  const RegisterNewCarMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No cars registered yet'));
  }
}
