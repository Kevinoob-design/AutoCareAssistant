import 'package:auto_care_assistant/shared/components/buttons/primary_button.dart' show PrimaryButton;
import 'package:auto_care_assistant/shared/components/inputs/input_text.dart' show InputTextFormField;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          InputTextFormField(
            hintText: AppLocalizations.of(context)!.formEmailHint,
            labelText: AppLocalizations.of(context)!.formEmailLabel,
            onChanged: (email) => {},
            onSaved: (email) => {},
            suffixIcon: '/assets/svgs/mail.svg',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: InputTextFormField(
              hintText: AppLocalizations.of(context)!.formPasswordHint,
              labelText: AppLocalizations.of(context)!.formPasswordLabel,
              onChanged: (password) => {},
              onSaved: (password) => {},
              suffixIcon: '/assets/svgs/lock.svg',
            ),
          ),
          InputTextFormField(
            hintText: AppLocalizations.of(context)!.formReEnterHint,
            labelText: AppLocalizations.of(context)!.formReEnterLabel,
            onChanged: (password) => {},
            onSaved: (password) => {},
            suffixIcon: '/assets/svgs/lock.svg',
          ),
          const SizedBox(height: 32),
          PrimaryButton(text: AppLocalizations.of(context)!.continueTextButton, cb: () => {}),
        ],
      ),
    );
  }
}
