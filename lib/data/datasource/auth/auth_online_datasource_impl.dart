import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/api_extentions.dart';
import 'package:online_exam/data/api/api_manager.dart';
import 'package:online_exam/data/api/model/user_dto.dart';
import 'package:online_exam/data/contracts/auth/auth_online_datasource.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/user.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDatasourceImpl implements AuthOnlineDataSource {
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
}
