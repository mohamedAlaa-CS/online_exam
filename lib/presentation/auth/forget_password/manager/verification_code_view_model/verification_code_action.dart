import 'package:online_exam/data/api/model/request/verifiay_reset_code_request.dart';

sealed class VerificationCodeAction {}

class VerifyCodeAction extends VerificationCodeAction {
  VerifiayResetCodeRequest verifiayResetCodeRequest;
  VerifyCodeAction(this.verifiayResetCodeRequest);
}

class ResendOtpAction extends VerificationCodeAction {}
