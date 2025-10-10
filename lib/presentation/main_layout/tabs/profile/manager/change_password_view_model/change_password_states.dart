import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/change_password_entity.dart';

sealed class ChangePasswordStates {}

class ChangePasswordInitial extends ChangePasswordStates {}

class ChangePasswordLoading extends ChangePasswordStates {}

class ChangePasswordSuccess extends ChangePasswordStates {
  final ChangePasswordEntity? changePasswordEntity;
  ChangePasswordSuccess(this.changePasswordEntity);
}

class ChangePasswordError extends ChangePasswordStates {
  final Exception? exception;
  ChangePasswordError(this.exception);
}
