import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/api_extentions.dart';
import 'package:online_exam/data/api/api_manager.dart';
import 'package:online_exam/data/api/model/request/signup_request_body.dart';
import 'package:online_exam/data/api/model/user_dto.dart';
import 'package:online_exam/data/contracts/auth/auth_online_datasource.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/user.dart';

@Injectable(as: AuthOnlineDatasource)
class AuthOnlineDatasourceImpl implements AuthOnlineDatasource {
  ApiManager apiManager;

  AuthOnlineDatasourceImpl(this.apiManager);

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
  Future<Result<String?>> forgetPassword(String email) {
    return executeApi<String>(
      () async {
        var response = await apiManager.forgetPassword(email);
        return response ?? '';
      },
    );
  }

  @override
  Future<Result<void>> resetCode(String resetCode) {
    return executeApi<void>(
      () async {
        var response = await apiManager.resetCode(resetCode);
        return response;
      },
    );
  }
}
