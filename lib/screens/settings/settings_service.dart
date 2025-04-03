import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show Intl;
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<bool> skipSplashScreen() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    final bool skipSplashScreen = preferences.getBool('skipSplashScreen') ?? false;

    return skipSplashScreen;
  }

  Future<ThemeMode> themeMode() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    switch (preferences.getString('themeMode')) {
      case 'ThemeMode.light':
        return ThemeMode.light;
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      case 'ThemeMode.system':
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }

  Future<Locale> locale() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    switch (preferences.getString('locale')) {
      case 'en':
        return Locale('en', '');
      case 'es':
        return Locale('es', '');
      default:
        return Locale('en', '');
    }
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('themeMode', theme.toString());
  }

  Future<void> updateLocale(Locale locale) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('locale', locale.toString());
  }
}
