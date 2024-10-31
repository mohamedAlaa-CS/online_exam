import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/api_extentions.dart';
import 'package:online_exam/data/api/api_manager.dart';
import 'package:online_exam/data/contracts/profile/profile_online_data_sourse.dart';
import 'package:online_exam/domin/common/api_result.dart';
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
}
