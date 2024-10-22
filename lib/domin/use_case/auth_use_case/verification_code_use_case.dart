import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/model/request/verifiay_reset_code_request.dart';
import 'package:online_exam/data/api/model/response/verifiay_reset_code_response.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/repositories/auth_repository.dart';

@injectable
class VerificationCodeUseCase {
  final AuthRepository authRepository;

  VerificationCodeUseCase({required this.authRepository});
  Future<Result<VerifiayResetCodeResponse>> verifiyResetCode(
      VerifiayResetCodeRequest verifiayResetCodeRequest) {
    return authRepository.verifiyResetCode(verifiayResetCodeRequest);
  }
}
