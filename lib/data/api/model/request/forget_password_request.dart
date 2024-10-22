class ForgetPasswordRequest {
  String? email;

  ForgetPasswordRequest({this.email});

  factory ForgetPasswordRequest.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordRequest(
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
      };
}
