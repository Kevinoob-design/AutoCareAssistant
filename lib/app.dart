import 'package:auto_care_assistant/screens/init_screen.dart' show InitScreen;
import 'package:auto_care_assistant/screens/signUp/signUp_screen.dart';
import 'package:auto_care_assistant/screens/signup/signup_controller.dart'
    show SignupController;
import 'package:auto_care_assistant/screens/splash/splash_controller.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_care_assistant/screens/splash/splash_screen.dart'
    show SplashScreen;
import 'screens/settings/settings_controller.dart' show SettingsController;
import 'shared/config/theme.dart' show AppTheme;
import 'shared/routes/routes.dart' show buildRoutes;

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle:
              (BuildContext context) => AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: AppTheme.lightTheme(context),
          darkTheme: AppTheme.darkTheme(context),
          themeMode: settingsController.themeMode,
          routes: buildRoutes(settingsController: settingsController),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (FirebaseAuth.instance.currentUser == null) {
                return settingsController.skipSplashScreen
                    ? SignUpScreen(controller: SignupController())
                    : SplashScreen(controller: SplashController());
              }
              return const InitScreen();
            },
          ),
        );
      },
    );
  }
}
