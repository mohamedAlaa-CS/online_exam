import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/repositories/auth_repository.dart';

@injectable
class ForgetPasswordUseCase {
  AuthRepository authRepository;

  ForgetPasswordUseCase(this.authRepository);
  Future<Result<String?>> forgetPassword(String email) async {
    return await authRepository.forgetPassword(email);
  }
}
