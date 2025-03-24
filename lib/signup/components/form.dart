import 'package:auto_care_assistant/otp/model/otp_args.dart' show OtpArguments;
import 'package:auto_care_assistant/shared/components/buttons/primary_button.dart' show PrimaryButton;
import 'package:auto_care_assistant/shared/components/inputs/input_text.dart' show InputTextFormField;
import 'package:flutter/services.dart' show FilteringTextInputFormatter;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    String parsedPhone = '+18491001234';

    void parsePhone(dynamic phone) {
      parsedPhone = '+$phone';
      // print(parsedPhone);
    }

    void goToOtp() {
      if (parsedPhone.isEmpty) return;

      Navigator.pushNamed(context, '/otp', arguments: OtpArguments(parsedPhone));
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
          PrimaryButton(text: AppLocalizations.of(context)!.continueTextButton, cb: goToOtp),
        ],
      ),
    );
  }
}
