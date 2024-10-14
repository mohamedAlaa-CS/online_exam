class SignupRequiestBody {
  SignupRequiestBody({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? rePassword;
  String? phone;
  @override
  String toString() {
    return 'SignupRequiestBody{username: $username, firstName: $firstName, lastName: $lastName, email: $email, password: $password, rePassword: $rePassword, phone: $phone}';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['password'] = password;
    map['rePassword'] = rePassword;
    map['phone'] = phone;
    return map;
  }
}
