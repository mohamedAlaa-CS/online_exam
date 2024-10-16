import 'package:injectable/injectable.dart';
import 'package:online_exam/data/contracts/auth/auth_online_datasource.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/user.dart';
import 'package:online_exam/domin/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepoImpl implements AuthRepository {
  AuthOnlineDatasource authOnlineDatasource;
  AuthOnlineDatasource authOfflineDatasource;

  AuthRepoImpl(this.authOnlineDatasource, this.authOfflineDatasource);
  @override
  Future<Result<User?>> signUp(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  ) {
    return authOnlineDatasource.signup(
      username,
      firstName,
      lastName,
      email,
      password,
      rePassword,
      phone,
    );
  }

  @override
  Future<Result<String?>> forgetPassword(String email) {
    return authOnlineDatasource.forgetPassword(email);
  }

  @override
  Future<Result<void>> verifiyResetCode(String resetCode) {
    return authOnlineDatasource.resetCode(resetCode);
  }
}
