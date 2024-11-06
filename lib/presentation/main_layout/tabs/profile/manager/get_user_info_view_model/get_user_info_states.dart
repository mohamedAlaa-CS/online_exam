import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/get_user_info_entity.dart';

sealed class GetUserInfoStates {}

class GetUserInfoInitial extends GetUserInfoStates {}

class GetUserInfoLoading extends GetUserInfoStates {}

class GetUserInfoSuccess extends GetUserInfoStates {
  final GetUserInfoEntity? getUserInfoEntity;
  GetUserInfoSuccess(this.getUserInfoEntity);
}

class GetUserInfoError extends GetUserInfoStates {
  final Exception? exception;
  GetUserInfoError(this.exception);
}
