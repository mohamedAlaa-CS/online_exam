import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/model/request/edit_profile_request.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/get_user_info_entity.dart';
import 'package:online_exam/domin/repositories/profile_repository.dart';

@injectable
class EditProfileUseCase {
  final ProfileRepository profileRepository;
  EditProfileUseCase(this.profileRepository);

  Future<Result<GetUserInfoEntity?>> invoke(
      EditProfileRequest editProfileRequest, String token) async {
    return await profileRepository.editUserInfo(editProfileRequest, token);
  }
}
