import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/get_user_info_entity.dart';

sealed class EditProfileStates {}

class EditProfileInitial extends EditProfileStates {}

class EditProfileLoading extends EditProfileStates {}

class EditProfileError extends EditProfileStates {
  Exception? exception;
  EditProfileError(this.exception);
}

class EditProfileSuccess extends EditProfileStates {
  GetUserInfoEntity? getUserInfoEntity;

  EditProfileSuccess(this.getUserInfoEntity);
}
