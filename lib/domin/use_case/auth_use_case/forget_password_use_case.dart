import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/model/request/forget_password_request.dart';
import 'package:online_exam/data/api/model/response/forget_password_response.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/repositories/auth_repository.dart';

@injectable
class ForgetPasswordUseCase {
  AuthRepository authRepository;

  ForgetPasswordUseCase(this.authRepository);
  Future<Result<ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest) async {
    return await authRepository.forgetPassword(forgetPasswordRequest);
  }
}
