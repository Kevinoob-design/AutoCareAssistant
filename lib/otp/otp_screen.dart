import 'package:auto_care_assistant/otp/components/otp_form.dart';
import 'package:auto_care_assistant/otp/model/otp_args.dart' show OtpArguments;
import 'package:auto_care_assistant/shared/components/headings/information.dart'
    show InformationText;
import 'package:auto_care_assistant/shared/components/headings/subtitle.dart';
import 'package:auto_care_assistant/shared/config/constants.dart'
    show borderSideColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
  static const routeName = '/otp';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as OtpArguments;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Subtitle(text: "OTP Verification"),
                  const SizedBox(height: 8),
                  InformationText(
                    text:
                        '${AppLocalizations.of(context)!.otpSentMessage} ${args.parsedPhone} \n${AppLocalizations.of(context)!.otpExpirationMessage} 00:30',
                  ),
                  const SizedBox(height: 16),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.20),
                  const OtpForm(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.otpResentMessage,
                      style: TextStyle(color: borderSideColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
