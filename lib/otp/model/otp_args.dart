class OtpArguments {
  final String parsedPhone;
  final String verificationId;
  final int? forceResendingToken;

  OtpArguments(this.parsedPhone, this.verificationId, this.forceResendingToken);
}
