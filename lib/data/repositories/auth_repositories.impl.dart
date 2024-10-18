import 'package:injectable/injectable.dart';
import 'package:online_exam/data/contracts/auth/auth_offline_datasource.dart';
import 'package:online_exam/data/contracts/auth/auth_online_datasource.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/user.dart';
import 'package:online_exam/domin/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepoImpl implements AuthRepository {
  AuthOnlineDatasource onlineDatasource;
  AuthOfflineDatasource offlineDatasource;

  AuthRepoImpl(this.onlineDatasource, this.offlineDatasource);

  @override
  Future<Result<User?>> login(String email, String password) {
    return onlineDatasource.login(email, password);
  }
}
