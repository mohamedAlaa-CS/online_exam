sealed class VerificationCodeAction {}

class VerifyCodeAction extends VerificationCodeAction {
  String verifiyCode;
  VerifyCodeAction(this.verifiyCode);
}

class ResendOtpAction extends VerificationCodeAction {}
