import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/model/user.dart';

abstract class AuthOnlineDatasource {
  Future<Result<User?>> signup(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  );
}
