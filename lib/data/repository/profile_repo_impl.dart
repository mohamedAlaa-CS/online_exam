import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/model/request/change_password_request.dart';
import 'package:online_exam/data/api/model/request/edit_profile_request.dart';
import 'package:online_exam/data/contracts/profile/profile_online_data_sourse.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/change_password_entity.dart';
import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/get_user_info_entity.dart';
import 'package:online_exam/domin/repositories/profile_repository.dart';

@Injectable(as: ProfileRepository)
class ProfileRepoImpl extends ProfileRepository {
  ProfileOnlineDataSourse profileOnlineDataSourse;
  ProfileRepoImpl({required this.profileOnlineDataSourse});
  @override
  Future<Result<GetUserInfoEntity?>> getUserInfo(String token) {
    return profileOnlineDataSourse.getUserInfo(token);
  }

  @override
  Future<Result<GetUserInfoEntity?>> editUserInfo(
      EditProfileRequest editProfileRequest, String token) {
    return profileOnlineDataSourse.editUserInfo(editProfileRequest, token);
  }

  @override
  Future<Result<ChangePasswordEntity?>> changePassword(
      ChangePasswordRequest changePasswordRequest, String token) {
    return profileOnlineDataSourse.changePassword(changePasswordRequest, token);
  }
}
