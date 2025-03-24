import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, PhoneAuthCredential, PhoneAuthProvider, PhoneCodeSent;
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';

class OtpService {
  static final auth = FirebaseAuth.instanceFor(app: Firebase.app());

  static void cbCompleted(PhoneAuthCredential credential) {}

  static void sendVerification(
    String parsedPhone,
    int? codeSentForceResendingToken,
    PhoneCodeSent cbCodeSent,
  ) {
    auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      forceResendingToken: codeSentForceResendingToken,
      phoneNumber: parsedPhone,
      verificationCompleted: cbCompleted,
      codeSent: cbCodeSent,
      verificationFailed: print,
      codeAutoRetrievalTimeout: print,
    );
  }

  static void signInWithSmsCode(
    String verificationId,
    String smsCode,
    VoidCallback cb,
  ) async {
    if (smsCode.length != 6 || verificationId.isEmpty) return;

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    cb();
  }
}
