import 'package:online_exam/data/api/model/request/change_password_request.dart';
import 'package:online_exam/data/api/model/request/edit_profile_request.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/change_password_entity.dart';
import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/get_user_info_entity.dart';

abstract class ProfileRepository {
  Future<Result<GetUserInfoEntity?>> getUserInfo(String token);
  Future<Result<GetUserInfoEntity?>> editUserInfo(
      EditProfileRequest editProfileRequest, String token);

  Future<Result<ChangePasswordEntity?>> changePassword(
    ChangePasswordRequest changePasswordRequest,
    String token,
  );
}
