import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/helper/functions/convert_secure_token_to_String.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/get_user_info_entity.dart';
import 'package:online_exam/domin/use_case/auth_use_case/get_user_info_use_case.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/manager/get_user_info_view_model/get_user_info_states.dart';

@injectable
class GetUserInfoViewMOdel extends Cubit<GetUserInfoStates> {
  GetUserInfoUseCase getUserInfoUseCase;
  GetUserInfoViewMOdel(this.getUserInfoUseCase) : super(GetUserInfoInitial()) {
    convertTokenAndGetUserInfo();
  }

  Future convertTokenAndGetUserInfo() async {
    return await convertTokenToString().then((token) => _getUserInfo(token));
  }

  _getUserInfo(String token) async {
    emit(GetUserInfoLoading());
    var result = await getUserInfoUseCase.invoke(token);

    switch (result) {
      case Success<GetUserInfoEntity?>():
        {
          emit(GetUserInfoSuccess(result.data));
          break;
        }

      case Fail<GetUserInfoEntity?>():
        {
          emit(GetUserInfoError(result.exception));
        }
    }
  }
}
