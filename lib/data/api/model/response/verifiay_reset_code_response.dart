class VerifiayResetCodeResponse {
  String? status;

  VerifiayResetCodeResponse({this.status});

  factory VerifiayResetCodeResponse.fromJson(Map<String, dynamic> json) {
    return VerifiayResetCodeResponse(
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
      };
}
