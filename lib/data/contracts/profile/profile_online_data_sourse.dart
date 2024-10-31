import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/get_user_info_entity.dart';

abstract class ProfileOnlineDataSourse {
  Future<Result<GetUserInfoEntity>> getUserInfo(String token);
}
