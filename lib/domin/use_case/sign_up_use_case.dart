import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/user.dart';
import 'package:online_exam/domin/repositories/auth_repository.dart';

@injectable
class SignupUseCase {
  AuthRepository authRepository;
  SignupUseCase(this.authRepository);

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
