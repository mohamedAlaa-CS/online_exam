import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/repositories/auth_repository.dart';

@injectable
class ResetPasswordUseCase {
  AuthRepository authRepository;
  ResetPasswordUseCase(this.authRepository);
  Future<Result<void>> resetPassword(String email, String password) {
    return authRepository.resetPassword(email, password);
  }
}
