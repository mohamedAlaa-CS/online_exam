import 'package:online_exam/domin/entities/user_entity.dart';

class UserDto {
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  DateTime? createdAt;
  String? passwordResetCode;
  DateTime? passwordResetExpires;
  bool? resetCodeVerified;

  UserDto({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        id: json['_id'] as String?,
        username: json['username'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        role: json['role'] as String?,
        isVerified: json['isVerified'] as bool?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        passwordResetCode: json['passwordResetCode'] as String?,
        passwordResetExpires: json['passwordResetExpires'] == null
            ? null
            : DateTime.parse(json['passwordResetExpires'] as String),
        resetCodeVerified: json['resetCodeVerified'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phone': phone,
        'role': role,
        'isVerified': isVerified,
        'createdAt': createdAt?.toIso8601String(),
        'passwordResetCode': passwordResetCode,
        'passwordResetExpires': passwordResetExpires?.toIso8601String(),
        'resetCodeVerified': resetCodeVerified,
      };

  UserEntity toEntity() => UserEntity(
        id: id,
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        role: role,
        isVerified: isVerified,
        createdAt: createdAt,
        passwordResetCode: passwordResetCode,
        passwordResetExpires: passwordResetExpires,
        resetCodeVerified: resetCodeVerified,
      );
}
