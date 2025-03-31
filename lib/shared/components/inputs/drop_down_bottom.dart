import 'package:auto_care_assistant/shared/config/constants.dart' show authOutlineInputBorder, kBorderSideColor;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputFormatter;
import 'package:flutter_svg/svg.dart';

class InputDropDownBottomFormField<T> extends StatelessWidget {
  const InputDropDownBottomFormField({
    super.key,
    required this.items,
    required this.onSaved,
    required this.onChanged,
    this.labelText = '',
    this.hintText = '',
    this.suffixIcon = '',
    this.inputType = TextInputType.text,
    this.inputFormatter = const [],
    this.validator,
  });

  final String? Function(T?)? validator;
  final List<DropdownMenuItem<T>> items;
  final String hintText;
  final String labelText;
  final FormFieldSetter onSaved;
  final FormFieldSetter onChanged;
  final String suffixIcon;
  final TextInputType inputType;
  final List<TextInputFormatter> inputFormatter;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      borderRadius: BorderRadius.circular(12),
      icon: const Icon(Icons.keyboard_arrow_down),
      decoration: InputDecoration(
        labelText: labelText.isEmpty ? null : labelText,
        hintText: hintText.isEmpty ? null : hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: const TextStyle(color: kBorderSideColor),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        suffix: suffixIcon.isNotEmpty ? SvgPicture.asset(suffixIcon) : null,
        border: authOutlineInputBorder,
        enabledBorder: authOutlineInputBorder,
        focusedBorder: authOutlineInputBorder.copyWith(borderSide: const BorderSide(color: Color(0xFFFF7643))),
      ),
      items: items,
    );
  }
}
