import 'package:auto_care_assistant/screens/otp/components/otp_number_box.dart' show OtpNumberBox;
import 'package:auto_care_assistant/screens/otp/services/otp_service.dart' show OtpService;
import 'package:auto_care_assistant/shared/config/constants.dart' show kBorderSideColor, primaryColor;
import 'package:flutter/services.dart' show HapticFeedback;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({
    super.key,
    required this.parsedPhone,
    required this.verificationId,
    required this.forceResendingToken,
  });

  final String parsedPhone;
  final String verificationId;
  final int? forceResendingToken;

  @override
  Widget build(BuildContext context) {
    List<int> verificationCode = [];
    String codeSentVerificationId = verificationId;
    int? codeSentForceResendingToken = forceResendingToken;

    void onPinChanged(String pin, int index) {
      if (pin.isNotEmpty) {
        verificationCode.insert(index, int.parse(pin));
        FocusScope.of(context).nextFocus();
      } else {
        verificationCode.removeAt(index);
        FocusScope.of(context).previousFocus();
      }
    }

    void cbCodeSent(String verificationId, int? forceResendingToken) {
      codeSentVerificationId = verificationId;
      codeSentForceResendingToken = forceResendingToken;
    }

    void cbOnContinuePress() {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }

    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpNumberBox(onChanged: onPinChanged, index: 0),
              OtpNumberBox(onChanged: onPinChanged, index: 1),
              OtpNumberBox(onChanged: onPinChanged, index: 2),
              OtpNumberBox(onChanged: onPinChanged, index: 3),
              OtpNumberBox(onChanged: onPinChanged, index: 4),
              OtpNumberBox(onChanged: onPinChanged, index: 5),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed:
                () => {
                  HapticFeedback.lightImpact(),
                  OtpService.signInWithSmsCode(codeSentVerificationId, verificationCode.join(), cbOnContinuePress),
                },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
            ),
            child: Text(AppLocalizations.of(context)!.continueTextButton),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          TextButton(
            onPressed: () => OtpService.sendVerification(parsedPhone, codeSentForceResendingToken, cbCodeSent),
            child: Text(AppLocalizations.of(context)!.otpResentMessage, style: TextStyle(color: kBorderSideColor)),
          ),
        ],
      ),
    );
  }
}
