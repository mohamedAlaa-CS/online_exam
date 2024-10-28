import 'user_dto.dart';

class GetUserInfoResponse {
  String? message;
  UserDto? user;

  GetUserInfoResponse({this.message, this.user});

  factory GetUserInfoResponse.fromJson(Map<String, dynamic> json) {
    return GetUserInfoResponse(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
      };
}
