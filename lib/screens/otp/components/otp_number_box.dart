import 'package:auto_care_assistant/shared/config/constants.dart'
    show kBorderSideColor, otpOutlineInputBorder, primaryColor;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show FilteringTextInputFormatter, LengthLimitingTextInputFormatter;

class OtpNumberBox extends StatelessWidget {
  const OtpNumberBox({super.key, required this.onChanged, required this.index});

  final Function(String pin, int index) onChanged;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: 54,
      child: TextFormField(
        onSaved: (pin) {},
        onChanged: (String pin) => onChanged(pin, index),
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
          hintStyle: const TextStyle(color: kBorderSideColor),
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
