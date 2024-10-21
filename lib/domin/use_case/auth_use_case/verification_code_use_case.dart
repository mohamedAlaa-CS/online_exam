import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/repositories/auth_repository.dart';

@injectable
class VerificationCodeUseCase {
  final AuthRepository authRepository;

  VerificationCodeUseCase({required this.authRepository});
  Future<Result<void>> verifiyResetCode(String resetCode) {
    return authRepository.verifiyResetCode(resetCode);
  }
}
