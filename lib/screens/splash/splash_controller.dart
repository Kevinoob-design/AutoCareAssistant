import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashController {
  SplashController();

  final List<String> images = ['assets/images/splash_1.png', 'assets/images/splash_2.png', 'assets/images/splash_3.png'];

  Map<String, String> getSplashData(BuildContext context, int index) {
    final List<String> textLocalizationMappings = [
      AppLocalizations.of(context)!.splashScreenFirstMessage,
      AppLocalizations.of(context)!.splashScreenSecondMessage,
      AppLocalizations.of(context)!.splashScreenThirdMessage,
    ];

    final String text = textLocalizationMappings[index];

    return {'text': text, 'image': images[index]};
  }
}
