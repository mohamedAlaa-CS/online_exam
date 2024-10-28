import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/user_entity.dart';
import 'package:online_exam/domin/repositories/auth_repository.dart';

@injectable
class GetUserInfoUseCase {
  final AuthRepository authRepository;

  GetUserInfoUseCase({required this.authRepository});

  Future<Result<UserEntity?>> invoke(String token) async {
    return await authRepository.getUserInfo(token);
  }
}
