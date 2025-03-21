import 'package:auto_care_assistant/splash/splash_controller.dart';
import 'package:flutter/widgets.dart';

import 'package:auto_care_assistant/splash/splash_screen.dart'
    show SplashScreen;
import '../../settings/settings_controller.dart' show SettingsController;
import '../../settings/settings_screen.dart' show SettingsScreen;

Map<String, WidgetBuilder> buildRoutes({
  required SettingsController settingsController,
}) {
  final Map<String, WidgetBuilder> routes = {
    SettingsScreen.routeName:
        (context) => SettingsScreen(controller: settingsController),
    SplashScreen.routeName:
        (context) => SplashScreen(controller: SplashController()),
  };

  return routes;
}
