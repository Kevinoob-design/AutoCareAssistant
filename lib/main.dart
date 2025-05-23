import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:auto_care_assistant/shared/firebase/firebase_options.dart';
import 'package:auto_care_assistant/screens/settings/settings_controller.dart' show SettingsController;
import 'package:auto_care_assistant/screens/settings/settings_service.dart' show SettingsService;
import 'package:auto_care_assistant/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}
