import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/repositories/auth_repository.dart';

@injectable
class ResetCodeUseCase {
  final AuthRepository authRepository;

  ResetCodeUseCase({required this.authRepository});
  Future<Result<void>> resetCode(String resetCode) {
    return authRepository.verifiyResetCode(resetCode);
  }
}
