import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/model/response/auth_response/auth_response.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/repositories/auth_repository.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase(this.authRepository);

  Future<Result<AuthResponse?>> invoke(String email, String password) {
    return authRepository.login(email, password);
  }
}
