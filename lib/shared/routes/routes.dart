import 'package:auto_care_assistant/settings/settings_controller.dart'
    show SettingsController;
import 'package:auto_care_assistant/settings/settings_screen.dart'
    show SettingsScreen;
import 'package:auto_care_assistant/signup/signup_controller.dart';
import 'package:auto_care_assistant/signup/signup_screen.dart'
    show SignUpScreen;
import 'package:auto_care_assistant/splash/splash_controller.dart';
import 'package:flutter/widgets.dart';

import 'package:auto_care_assistant/splash/splash_screen.dart'
    show SplashScreen;

Map<String, WidgetBuilder> buildRoutes({
  required SettingsController settingsController,
}) {
  final Map<String, WidgetBuilder> routes = {
    SettingsScreen.routeName:
        (context) => SettingsScreen(controller: settingsController),
    SplashScreen.routeName:
        (context) => SplashScreen(controller: SplashController()),
    SignUpScreen.routeName:
        (context) => SignUpScreen(controller: SignupController()),
  };

  return routes;
}
