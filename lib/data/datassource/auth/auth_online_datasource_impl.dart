import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/api_extentions.dart';
import 'package:online_exam/data/api/api_manager.dart';
import 'package:online_exam/data/api/model/request/forget_password_request.dart';
import 'package:online_exam/data/api/model/request/signup_request_body.dart';
import 'package:online_exam/data/api/model/response/forget_password_response.dart';
import 'package:online_exam/data/api/model/user_dto.dart';
import 'package:online_exam/data/contracts/auth/auth_online_datasource.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/user.dart';

@Injectable(as: AuthOnlineDatasource)
class AuthOnlineDatasourceImpl implements AuthOnlineDatasource {
  ApiManager apiManager;

  AuthOnlineDatasourceImpl(this.apiManager);

  @override
  Future<Result<User?>> login(String email, String password) async {
    return executeApi<User>(
      () async {
        var authResponse = await apiManager.login(email, password);
        var userDto = UserDto(token: authResponse?.token);
        return userDto.toUser();
      },
    );
  }

  @override
  Future<Result<User?>> signup(
      String username,
      String firstName,
      String lastName,
      String email,
      String password,
      String rePassword,
      String phone) async {
    var body = SignupRequiestBody(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone);
    return executeApi<User>(
      () async {
        var response = await apiManager.signup(body);
        var userDto = UserDto(token: response?.token);
        return userDto.toUser();
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
  Future<Result<void>> verificationCode(String resetCode) {
    return executeApi<void>(
      () async {
        var response = await apiManager.verificationCode(resetCode);
        return response;
      },
    );
  }

  @override
  Future<Result<void>> resetPassword(String email, String password) {
    return executeApi<void>(
      () async {
        var response = await apiManager.resetPassword(email, password);
        return response;
      },
    );
  }
}
