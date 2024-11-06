class EditProfileRequest {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  EditProfileRequest({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phone': phone,
      };
}
