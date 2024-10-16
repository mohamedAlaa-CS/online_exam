import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/user.dart';

abstract class AuthRepository {
  Future<Result<User?>> signUp(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  );
  Future<Result<String?>> forgetPassword(String email);
  Future<Result<void>> verifiyResetCode(String resetCode);
  Future<Result<void>> resetPassword(String email, String password);
}
