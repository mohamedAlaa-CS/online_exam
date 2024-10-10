import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/model/user.dart';
import 'package:online_exam/domin/repository/auth_repo.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;
  RegisterUseCase(this.authRepository);

  Future<Result<User?>> invoke(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  ) {
    return authRepository.signUp(
      username,
      firstName,
      lastName,
      email,
      password,
      rePassword,
      phone,
    );
  }
}
