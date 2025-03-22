import 'package:auto_care_assistant/shared/config/constants.dart' show authOutlineInputBorder;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InputTextFormField extends StatelessWidget {
  const InputTextFormField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.onSaved,
    required this.onChanged,
    required this.suffixIcon,
  });

  final String hintText;
  final String labelText;
  final FormFieldSetter onSaved;
  final FormFieldSetter onChanged;
  final String suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: const TextStyle(color: Color(0xFF757575)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        suffix: SvgPicture.string(suffixIcon),
        border: authOutlineInputBorder,
        enabledBorder: authOutlineInputBorder,
        focusedBorder: authOutlineInputBorder.copyWith(borderSide: const BorderSide(color: Color(0xFFFF7643))),
      ),
    );
  }
}
