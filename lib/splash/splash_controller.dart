import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashController {
  SplashController();

  final List<String> images = [
    "https://i.postimg.cc/mhhVywp9/splash-1.png",
    "https://i.postimg.cc/PNcy3w0R/splash-2.png",
    "https://i.postimg.cc/wRtVxqR2/splash-3.png",
  ];

  Map<String, String> getSplashData(BuildContext context, int index) {
    final List<String> textLocalizationMappings = [
      AppLocalizations.of(context)!.splashScreenFirstMessage,
      AppLocalizations.of(context)!.splashScreenSecondMessage,
      AppLocalizations.of(context)!.splashScreenThirdMessage,
    ];

    final String text = textLocalizationMappings[index];

    return {"text": text, "image": images[index]};
  }
}
