import 'package:auto_care_assistant/otp/components/otp_number_box.dart'
    show OtpNumberBox;
import 'package:auto_care_assistant/otp/services/otp_service.dart'
    show OtpService;
import 'package:auto_care_assistant/shared/config/constants.dart'
    show borderSideColor, primaryColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key, required this.parsedPhone});

  final String parsedPhone;

  @override
  Widget build(BuildContext context) {
    List<int> verificationCode = [];

    void onPinChanged(String pin) {
      if (pin.isNotEmpty) {
        verificationCode.add(int.parse(pin));
        FocusScope.of(context).nextFocus();
      }
    }

    String codeSentVerificationId = '';
    int forceResendingToken = 0;

    void cbCodeSent(String verificationId, int? forceResendingToken) {
      codeSentVerificationId = verificationId;
      forceResendingToken = forceResendingToken;
    }

    void cbOnContinuePress() {
      Navigator.pushNamed(context, '/home');
    }

    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpNumberBox(onChanged: onPinChanged),
              OtpNumberBox(onChanged: onPinChanged),
              OtpNumberBox(onChanged: onPinChanged),
              OtpNumberBox(onChanged: onPinChanged),
              OtpNumberBox(onChanged: onPinChanged),
              OtpNumberBox(onChanged: onPinChanged),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed:
                () => OtpService.signInWithSmsCode(
                  codeSentVerificationId,
                  verificationCode.join(),
                  cbOnContinuePress,
                ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
            child: Text(AppLocalizations.of(context)!.continueTextButton),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          TextButton(
            onPressed:
                () => OtpService.sendVerification(
                  parsedPhone,
                  forceResendingToken,
                  cbCodeSent,
                ),
            child: Text(
              AppLocalizations.of(context)!.otpResentMessage,
              style: TextStyle(color: borderSideColor),
            ),
          ),
        ],
      ),
    );
  }
}
