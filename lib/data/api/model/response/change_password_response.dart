import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/change_password_entity.dart';

class ChangePasswordResponse {
  String? message;
  String? token;

  ChangePasswordResponse({this.message, this.token});

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    return ChangePasswordResponse(
      message: json['message'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'token': token,
      };

  ChangePasswordEntity toEtity() {
    return ChangePasswordEntity(
      message: message,
      token: token,
    );
  }
}
