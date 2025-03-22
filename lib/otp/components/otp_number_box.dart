import 'package:auto_care_assistant/shared/config/constants.dart'
    show borderSideColor, otpOutlineInputBorder, primaryColor;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show FilteringTextInputFormatter, LengthLimitingTextInputFormatter;

class OtpNumberBox extends StatelessWidget {
  const OtpNumberBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: 54,
      child: TextFormField(
        onSaved: (pin) {},
        onChanged: (pin) {
          if (pin.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
        },
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: "0",
          hintStyle: const TextStyle(color: borderSideColor),
          border: otpOutlineInputBorder,
          enabledBorder: otpOutlineInputBorder,
          focusedBorder: otpOutlineInputBorder.copyWith(
            borderSide: const BorderSide(color: primaryColor),
          ),
        ),
      ),
    );
  }
}
