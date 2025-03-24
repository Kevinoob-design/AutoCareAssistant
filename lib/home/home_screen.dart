import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static const routeName = '/home';

  final fireBaseAuth = FirebaseAuth.instanceFor(app: Firebase.app());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Icon(Icons.notifications)]),
      body: Text(fireBaseAuth.currentUser?.uid as String),
    );
  }
}
