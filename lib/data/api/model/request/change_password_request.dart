class ChangePasswordRequest {
  String? oldPassword;
  String? password;
  String? rePassword;

  ChangePasswordRequest({this.oldPassword, this.password, this.rePassword});

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) {
    return ChangePasswordRequest(
      oldPassword: json['oldPassword'] as String?,
      password: json['password'] as String?,
      rePassword: json['rePassword'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'oldPassword': oldPassword,
        'password': password,
        'rePassword': rePassword,
      };
}
