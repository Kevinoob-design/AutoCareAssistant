import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFFF7643);
const double toolbarHeight = 56.0;
const double elevation = 0;

const Color kBorderSideColor = Color(0xFF757575);

const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: kBorderSideColor),
  borderRadius: BorderRadius.all(Radius.circular(100)),
);

const otpOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFF757575)),
  borderRadius: BorderRadius.all(Radius.circular(12)),
);

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Colors.black;

const kAnimationDuration = Duration(milliseconds: 200);

const headingStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black, height: 1.5);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
const String kEmailNullError = 'Please Enter your email';
const String kInvalidEmailError = 'Please Enter Valid Email';
const String kPassNullError = 'Please Enter your password';
const String kShortPassError = 'Password is too short';
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = 'Please Enter your name';
const String kPhoneNumberNullError = 'Please Enter your phone number';
const String kAddressNullError = 'Please Enter your address';

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 16),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: kTextColor));
}
