class ResetPasswordRequest {
  String? email;
  String? newPassword;

  ResetPasswordRequest({this.email, this.newPassword});

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) {
    return ResetPasswordRequest(
      email: json['email'] as String?,
      newPassword: json['newPassword'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'newPassword': newPassword,
      };
}
