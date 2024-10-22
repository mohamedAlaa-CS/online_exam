import 'package:online_exam/data/api/model/request/forget_password_request.dart';
import 'package:online_exam/data/api/model/request/reset_password_request.dart';
import 'package:online_exam/data/api/model/request/signup_request_body.dart';
import 'package:online_exam/data/api/model/request/verifiay_reset_code_request.dart';
import 'package:online_exam/data/api/model/response/auth_response/auth_response.dart';
import 'package:online_exam/data/api/model/response/forget_password_response.dart';
import 'package:online_exam/data/api/model/response/reset_password_response.dart';
import 'package:online_exam/data/api/model/response/verifiay_reset_code_response.dart';
import 'package:online_exam/domin/common/api_result.dart';

abstract class AuthRepository {
  Future<Result<AuthResponse?>> login(String email, String password);
  Future<Result<AuthResponse?>> signUp(SignupRequiestBody signupRequiestBody);
  Future<Result<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest forgetPasswordRequest,
  );
  Future<Result<VerifiayResetCodeResponse>> verifiyResetCode(
    VerifiayResetCodeRequest verifiayResetCodeRequest,
  );
  Future<Result<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest resetPasswordRequest);
}
