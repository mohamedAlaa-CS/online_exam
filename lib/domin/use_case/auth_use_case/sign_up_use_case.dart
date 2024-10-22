import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/model/request/signup_request_body.dart';
import 'package:online_exam/data/api/model/response/auth_response/auth_response.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/repositories/auth_repository.dart';

@injectable
class SignupUseCase {
  AuthRepository authRepository;
  SignupUseCase(this.authRepository);

  Future<Result<AuthResponse?>> invoke(
    SignupRequiestBody signupRequiestBody,
  ) {
    return authRepository.signUp(signupRequiestBody);
  }
}
