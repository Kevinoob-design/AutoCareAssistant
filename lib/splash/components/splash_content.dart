import 'package:auto_care_assistant/shared/components/containers/image_container.dart'
    show ImageContainer;
import 'package:auto_care_assistant/shared/components/headings/heading.dart'
    show Heading;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashContent extends StatefulWidget {
  const SplashContent({super.key, this.text, this.image});
  final String? text, image;

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Heading(text: AppLocalizations.of(context)!.appTitle),
        Text(widget.text!, textAlign: TextAlign.center),
        const Spacer(flex: 2),
        ImageContainer(image: widget.image!),
      ],
    );
  }
}
