import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/api_extentions.dart';
import 'package:online_exam/data/api/api_manager.dart';
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

@Injectable(as: AuthOnlineDatasource)
class AuthOnlineDatasourceImpl implements AuthOnlineDatasource {
  ApiManager apiManager;

  AuthOnlineDatasourceImpl(this.apiManager);

  @override
  Future<Result<AuthResponse?>> login(String email, String password) async {
    return executeApi<AuthResponse>(
      () async {
        var authResponse = await apiManager.login(email, password);
        return authResponse;
      },
    );
  }

  @override
  Future<Result<AuthResponse?>> signup(
      SignupRequiestBody signupRequiestBody) async {
    return executeApi<AuthResponse>(
      () async {
        var response = await apiManager.signup(signupRequiestBody);
        return response;
      },
    );
  }

  @override
  Future<Result<ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest) {
    return executeApi<ForgetPasswordResponse>(
      () async {
        var response = await apiManager.forgetPassword(forgetPasswordRequest);
        return response;
      },
    );
  }

  @override
  Future<Result<VerifiayResetCodeResponse>> verificationCode(
      VerifiayResetCodeRequest verifiayResetCodeRequest) {
    return executeApi<VerifiayResetCodeResponse>(
      () async {
        var response =
            await apiManager.verificationCode(verifiayResetCodeRequest);
        return response;
      },
    );
  }

  @override
  Future<Result<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest resetPasswordRequest) {
    return executeApi<ResetPasswordResponse>(
      () async {
        var response = await apiManager.resetPassword(resetPasswordRequest);
        return response;
      },
    );
  }
}
