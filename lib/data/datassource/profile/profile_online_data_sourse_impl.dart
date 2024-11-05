import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/api_extentions.dart';
import 'package:online_exam/data/api/api_manager.dart';
import 'package:online_exam/data/api/model/request/change_password_request.dart';
import 'package:online_exam/data/api/model/request/edit_profile_request.dart';
import 'package:online_exam/data/contracts/profile/profile_online_data_sourse.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/change_password_entity.dart';
import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/get_user_info_entity.dart';

@Injectable(as: ProfileOnlineDataSourse)
class ProfileOnlineDataSourseImpl implements ProfileOnlineDataSourse {
  ApiManager apiManager;

  ProfileOnlineDataSourseImpl({required this.apiManager});
  @override
  Future<Result<GetUserInfoEntity>> getUserInfo(String token) {
    return executeApi<GetUserInfoEntity>(
      () async {
        var response = await apiManager.getUserInfo(token);
        return response;
      },
    );
  }

  @override
  Future<Result<GetUserInfoEntity>> editUserInfo(
      EditProfileRequest editProfileRequest, String token) {
    return executeApi<GetUserInfoEntity>(
      () async {
        var response = await apiManager.editUserInfo(editProfileRequest, token);
        return response;
      },
    );
  }

  @override
  Future<Result<ChangePasswordEntity>> changePassword(
      ChangePasswordRequest changePasswordRequest, String token) {
    return executeApi<ChangePasswordEntity>(
      () async {
        var response =
            await apiManager.changePassword(changePasswordRequest, token);
        return response;
      },
    );
  }
}
