import 'package:auto_care_assistant/screens/car_catalog/car_service.dart' show CarService;
import 'package:auto_care_assistant/screens/car_catalog/components/bottom_add_car.dart' show BottomNavBarAddCar;
import 'package:auto_care_assistant/screens/car_catalog/components/car_card.dart' show CarCard;
import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore, QuerySnapshot;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                Text(AppLocalizations.of(context)!.yourCarsTitle),
                Text(
                  '$length ${AppLocalizations.of(context)!.yourCarsSingularSubTitle}${length == 1 ? "" : "s"}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
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
                      final String title = (snapshot.data?.docs[index].data() as Map<String, dynamic>)['title'];

                      return AlertDialog(
                        title: Text('${AppLocalizations.of(context)!.confirmTitle} $title'),
                        content: Text(AppLocalizations.of(context)!.confirmMessage),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                            child: Text(AppLocalizations.of(context)!.deleteButton),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: Text(AppLocalizations.of(context)!.cancelButton),
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
                  id: snapshot.data?.docs[index].id as String,
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
    return Center(child: Text(AppLocalizations.of(context)!.noCarsRegisterMessage));
  }
}
