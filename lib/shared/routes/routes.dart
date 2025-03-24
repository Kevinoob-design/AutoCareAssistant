import 'package:auto_care_assistant/screens/home/home_screen.dart'
    show HomeScreen;
import 'package:auto_care_assistant/screens/otp/otp_screen.dart' show OtpScreen;
import 'package:auto_care_assistant/screens/settings/settings_controller.dart'
    show SettingsController;
import 'package:auto_care_assistant/screens/settings/settings_screen.dart'
    show SettingsScreen;
import 'package:auto_care_assistant/screens/signup/signup_controller.dart';
import 'package:auto_care_assistant/screens/signup/signup_screen.dart'
    show SignUpScreen;
import 'package:auto_care_assistant/screens/splash/splash_controller.dart';
import 'package:flutter/widgets.dart';

import 'package:auto_care_assistant/screens/splash/splash_screen.dart'
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
    OtpScreen.routeName: (context) => OtpScreen(),
    HomeScreen.routeName: (context) => HomeScreen(),
  };

  return routes;
}
