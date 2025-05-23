import 'package:auto_care_assistant/screens/car_catalog/my_cars_screen.dart' show MyCarsScreen;
import 'package:auto_care_assistant/screens/car_edit/car_edit_screen.dart' show CarEditScreen;
import 'package:auto_care_assistant/screens/home/home_screen.dart' show HomeScreen;
import 'package:auto_care_assistant/screens/otp/otp_screen.dart' show OtpScreen;
import 'package:auto_care_assistant/screens/program_service/program_date_screen.dart' show ProgramDate;
import 'package:auto_care_assistant/screens/program_service/program_service_screen.dart' show ProgramService;
import 'package:auto_care_assistant/screens/settings/settings_controller.dart' show SettingsController;
import 'package:auto_care_assistant/screens/settings/settings_screen.dart' show SettingsScreen;
import 'package:auto_care_assistant/screens/signup/signup_controller.dart';
import 'package:auto_care_assistant/screens/signup/signup_screen.dart' show SignUpScreen;
import 'package:auto_care_assistant/screens/splash/splash_controller.dart';
import 'package:flutter/widgets.dart';

import 'package:auto_care_assistant/screens/splash/splash_screen.dart' show SplashScreen;

Map<String, WidgetBuilder> buildRoutes({required SettingsController settingsController}) {
  final Map<String, WidgetBuilder> routes = {
    SettingsScreen.routeName: (context) => SettingsScreen(controller: settingsController),
    SplashScreen.routeName: (context) => SplashScreen(controller: SplashController()),
    SignUpScreen.routeName: (context) => SignUpScreen(controller: SignupController()),
    OtpScreen.routeName: (context) => OtpScreen(),
    HomeScreen.routeName: (context) => HomeScreen(),
    MyCarsScreen.routeName: (context) => MyCarsScreen(),
    CarEditScreen.routeName: (context) => CarEditScreen(),
    ProgramService.routeName: (context) => ProgramService(),
    ProgramDate.routeName: (context) => ProgramDate(),
  };

  return routes;
}
