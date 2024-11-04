import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/helper/functions/convert_secure_token_to_String.dart';
import 'package:online_exam/data/api/model/request/edit_profile_request.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/get_user_info_entity.dart';
import 'package:online_exam/domin/use_case/profile_use_case/edit_profile_use_case.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/manager/edit_profile_view_model/edit_profile_states.dart';

@injectable
class EditProfileViewModel extends Cubit<EditProfileStates> {
  final EditProfileUseCase _editProfileUseCase;

  EditProfileViewModel(this._editProfileUseCase) : super(EditProfileInitial());
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController =
      TextEditingController(text: '123456');
  Future<void> convertTokenAndEditUserInfo() async {
    return await convertTokenToString().then((token) => _editProfile(token));
  }

  _editProfile(String token) async {
    emit(EditProfileLoading());
    EditProfileRequest editProfileRequest = EditProfileRequest(
      username: userNameController.text.trim(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
    );
    var result = await _editProfileUseCase.invoke(
      editProfileRequest,
      token,
    );

    switch (result) {
      case Success<GetUserInfoEntity?>():
        {
          userNameController.text = result.data?.user?.username ?? '';
          firstNameController.text = result.data?.user?.firstName ?? '';
          lastNameController.text = result.data?.user?.lastName ?? '';
          emailController.text = result.data?.user?.email ?? '';
          phoneController.text = result.data?.user?.phone ?? '';
          emit(EditProfileSuccess(result.data));
          break;
        }
      case Fail<GetUserInfoEntity?>():
        {
          emit(EditProfileError(result.exception));
        }
    }
  }
}
