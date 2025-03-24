import 'package:auto_care_assistant/otp/model/otp_args.dart' show OtpArguments;
import 'package:auto_care_assistant/otp/services/otp_service.dart'
    show OtpService;
import 'package:auto_care_assistant/shared/components/buttons/primary_button.dart'
    show PrimaryButton;
import 'package:auto_care_assistant/shared/components/inputs/input_text.dart'
    show InputTextFormField;
import 'package:flutter/services.dart' show FilteringTextInputFormatter;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    String parsedPhone = '';

    void parsePhone(dynamic phone) {
      parsedPhone = '+$phone';
    }

    bool verifyNumber(String phone) {
      if (phone.isEmpty) return false;
      if (phone.length != 12) return false;

      final String internationalCode = phone.substring(0, 2);
      final String countryAreaCode = phone.substring(2, 5);
      final String localPhoneNumber = phone.substring(5);

      if (internationalCode != '+1') return false;
      if (!['809', '829', '849'].contains(countryAreaCode)) return false;
      if (localPhoneNumber.length != 7) return false;

      return true;
    }

    void cbCodeSent(String verificationId, int? forceResendingToken) {
      Navigator.pushNamed(
        context,
        '/otp',
        arguments: OtpArguments(
          parsedPhone,
          verificationId,
          forceResendingToken,
        ),
      );
    }

    void goToOtp() async {
      if (!verifyNumber(parsedPhone)) return;

      await OtpService.sendVerification(parsedPhone, null, cbCodeSent);
    }

    return Form(
      child: Column(
        children: [
          InputTextFormField(
            hintText: AppLocalizations.of(context)!.formPhoneHint,
            labelText: AppLocalizations.of(context)!.formPhoneLabel,
            onChanged: parsePhone,
            onSaved: (phone) => {},
            suffixIcon: '/assets/svgs/mail.svg',
            inputType: TextInputType.phone,
            inputFormatter: [FilteringTextInputFormatter.digitsOnly],
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            text: AppLocalizations.of(context)!.continueTextButton,
            cb: goToOtp,
          ),
        ],
      ),
    );
  }
}
