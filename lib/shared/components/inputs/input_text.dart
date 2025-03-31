import 'package:auto_care_assistant/shared/config/constants.dart' show authOutlineInputBorder, kBorderSideColor;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputFormatter;
import 'package:flutter_svg/svg.dart';

class InputTextFormField extends StatelessWidget {
  const InputTextFormField({
    super.key,
    this.hintText = '',
    this.labelText = '',
    required this.onSaved,
    required this.onChanged,
    this.suffixIcon = '',
    this.inputType = TextInputType.text,
    this.inputFormatter = const [],
    this.controller,
    this.validator,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String hintText;
  final String labelText;
  final FormFieldSetter onSaved;
  final FormFieldSetter onChanged;
  final String suffixIcon;
  final TextInputType inputType;
  final List<TextInputFormatter> inputFormatter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      keyboardType: inputType,
      inputFormatters: inputFormatter,
      decoration: InputDecoration(
        hintText: hintText.isEmpty ? null : hintText,
        labelText: labelText.isEmpty ? null : labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: const TextStyle(color: kBorderSideColor),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        suffix: suffixIcon.isNotEmpty ? SvgPicture.asset(suffixIcon) : null,
        border: authOutlineInputBorder,
        enabledBorder: authOutlineInputBorder,
        focusedBorder: authOutlineInputBorder.copyWith(borderSide: const BorderSide(color: Color(0xFFFF7643))),
      ),
    );
  }
}
