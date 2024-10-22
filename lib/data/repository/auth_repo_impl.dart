import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/model/request/forget_password_request.dart';
import 'package:online_exam/data/api/model/request/reset_password_request.dart';
import 'package:online_exam/data/api/model/request/signup_request_body.dart';
import 'package:online_exam/data/api/model/request/verifiay_reset_code_request.dart';
import 'package:online_exam/data/api/model/response/auth_response/auth_response.dart';
import 'package:online_exam/data/api/model/response/forget_password_response.dart';
import 'package:online_exam/data/api/model/response/reset_password_response.dart';
import 'package:online_exam/data/api/model/response/verifiay_reset_code_response.dart';
import 'package:online_exam/data/contracts/auth/auth_online_datasource.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepoImpl implements AuthRepository {
  AuthOnlineDatasource authOnlineDatasource;

  AuthRepoImpl(this.authOnlineDatasource);

  @override
  Future<Result<AuthResponse?>> login(String email, String password) {
    return authOnlineDatasource.login(email, password);
  }

  @override
  Future<Result<AuthResponse?>> signUp(
    SignupRequiestBody signupRequiestBody,
  ) {
    return authOnlineDatasource.signup(signupRequiestBody);
  }

  @override
  Future<Result<ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest) {
    return authOnlineDatasource.forgetPassword(forgetPasswordRequest);
  }

  @override
  Future<Result<VerifiayResetCodeResponse>> verifiyResetCode(
      VerifiayResetCodeRequest verifiayResetCodeRequest) {
    return authOnlineDatasource.verificationCode(verifiayResetCodeRequest);
  }

  @override
  Future<Result<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest resetPasswordRequest) {
    return authOnlineDatasource.resetPassword(resetPasswordRequest);
  }
}
