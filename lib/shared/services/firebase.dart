import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException, PhoneAuthCredential;

class FirebaseService {
  // Phone number must be in format e164: +44 7123 123 456
  static verifyPhoneNumber(
    String phoneNumber,
    Function(PhoneAuthCredential) cbCompleted,
    Function(String, int?) cbCodeSent,
  ) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: cbCompleted,
      verificationFailed: (FirebaseAuthException e) {
        print(e);
      },
      codeSent: cbCodeSent,
      codeAutoRetrievalTimeout: (String verificationId) {
        print(verificationId);
      },
    );
  }
}
