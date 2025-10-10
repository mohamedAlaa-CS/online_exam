import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/model/request/change_password_request.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/repositories/profile_repository.dart';

import '../../entities/profile_entity/get_user_info_entity/change_password_entity.dart';

@injectable
class ChangePasswordUseCase {
  final ProfileRepository profileRepository;

  ChangePasswordUseCase(this.profileRepository);

  Future<Result<ChangePasswordEntity?>> invoke(
      ChangePasswordRequest changePasswordRequest, String token) async {
    return await profileRepository.changePassword(changePasswordRequest, token);
  }
}
