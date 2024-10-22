import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/model/request/reset_password_request.dart';
import 'package:online_exam/data/api/model/response/reset_password_response.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/repositories/auth_repository.dart';

@injectable
class ResetPasswordUseCase {
  AuthRepository authRepository;
  ResetPasswordUseCase(this.authRepository);
  Future<Result<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest resetPasswordRequest) {
    return authRepository.resetPassword(resetPasswordRequest);
  }
}
