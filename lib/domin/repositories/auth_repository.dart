import 'package:online_exam/data/api/model/request/forget_password_request.dart';
import 'package:online_exam/data/api/model/request/reset_password_request.dart';
import 'package:online_exam/data/api/model/request/verifiay_reset_code_request.dart';
import 'package:online_exam/data/api/model/response/forget_password_response.dart';
import 'package:online_exam/data/api/model/response/reset_password_response.dart';
import 'package:online_exam/data/api/model/response/verifiay_reset_code_response.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/user.dart';

abstract class AuthRepository {
  Future<Result<User?>> login(String email, String password);
  Future<Result<User?>> signUp(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  );
  Future<Result<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest forgetPasswordRequest,
  );
  Future<Result<VerifiayResetCodeResponse>> verifiyResetCode(
    VerifiayResetCodeRequest verifiayResetCodeRequest,
  );
  Future<Result<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest resetPasswordRequest);
}
