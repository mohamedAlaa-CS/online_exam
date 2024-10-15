import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/user.dart';

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

  Future<Result<String?>> forgetPassword(String email);
}
