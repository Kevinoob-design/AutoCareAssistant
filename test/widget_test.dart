// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:auto_care_assistant/app.dart';
import 'package:auto_care_assistant/settings/settings_controller.dart';
import 'package:auto_care_assistant/settings/settings_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();

  testWidgets('Splash Screen smoke test', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp(settingsController: settingsController));

      expect(find.text('AutoCare Assistant'), findsOneWidget);
    });
  });
}
