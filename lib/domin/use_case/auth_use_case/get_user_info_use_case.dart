import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/get_user_info_entity.dart';
import 'package:online_exam/domin/repositories/profile_repository.dart';

@injectable
class GetUserInfoUseCase {
  final ProfileRepository profileRepository;

  GetUserInfoUseCase({required this.profileRepository});

  Future<Result<GetUserInfoEntity?>> invoke(String token) async {
    return await profileRepository.getUserInfo(token);
  }
}
