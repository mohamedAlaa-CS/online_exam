class VerifiayResetCodeRequest {
  String? resetCode;

  VerifiayResetCodeRequest({this.resetCode});

  factory VerifiayResetCodeRequest.fromJson(Map<String, dynamic> json) {
    return VerifiayResetCodeRequest(
      resetCode: json['resetCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'resetCode': resetCode,
      };
}
