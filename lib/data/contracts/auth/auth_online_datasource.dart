import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/user.dart';

abstract class AuthOnlineDatasource {
  Future<Result<User?>> login(String email, String password);
}
