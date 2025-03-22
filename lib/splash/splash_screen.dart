import 'package:auto_care_assistant/shared/components/buttons/primary_button.dart'
    show PrimaryButton;
import 'package:auto_care_assistant/shared/components/indicators/page_indicator.dart'
    show PageIndicators;
import 'package:auto_care_assistant/splash/components/splash_content.dart'
    show SplashContent;
import 'package:auto_care_assistant/splash/splash_controller.dart'
    show SplashController;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.controller});

  static const routeName = '/feed';
  final SplashController controller;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: widget.controller.images.length,
                  itemBuilder:
                      (context, index) => SplashContent(
                        image:
                            widget.controller.getSplashData(
                              context,
                              index,
                            )["image"],
                        text:
                            widget.controller.getSplashData(
                              context,
                              index,
                            )['text'],
                      ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      PageIndicators(
                        totalPages: widget.controller.images.length,
                        currentPage: currentPage,
                      ),
                      const Spacer(flex: 3),
                      PrimaryButton(
                        text: AppLocalizations.of(context)!.continueTextButton,
                        cb: () => Navigator.pushNamed(context, '/signup'),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
