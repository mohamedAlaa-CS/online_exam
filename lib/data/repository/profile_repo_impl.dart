import 'package:injectable/injectable.dart';
import 'package:online_exam/data/contracts/profile/profile_online_data_sourse.dart';
import 'package:online_exam/domin/common/api_result.dart';
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
}
