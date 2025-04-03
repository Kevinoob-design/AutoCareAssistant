import 'package:auto_care_assistant/shared/components/inputs/drop_down_bottom.dart' show InputDropDownBottomFormField;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_care_assistant/screens/settings/settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settingsTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: Column(
          spacing: 20,
          children: [
            Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.themeSelectionTitle),
                InputDropDownBottomFormField<ThemeMode>(
                  // Read the selected themeMode from the controller
                  initialValue: controller.themeMode,
                  // Call the updateThemeMode method any time the user selects a theme.
                  onChanged: controller.updateThemeMode,
                  items: [
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text(AppLocalizations.of(context)!.themeSelectionDefault),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text(AppLocalizations.of(context)!.themeSelectionLight),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text(AppLocalizations.of(context)!.themeSelectionDark),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.localeSelectionTitle),
                InputDropDownBottomFormField<Locale>(
                  initialValue: controller.locale,
                  onChanged: controller.updateLocale,
                  items: [
                    DropdownMenuItem(
                      value: Locale('en', ''),
                      child: Text(AppLocalizations.of(context)!.localeSelectionEn),
                    ),
                    DropdownMenuItem(
                      value: Locale('es', ''),
                      child: Text(AppLocalizations.of(context)!.localeSelectionEs),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
