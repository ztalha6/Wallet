class SignUpRequestModel {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;

  SignUpRequestModel(
      {this.name, this.email, this.password, this.confirmPassword});

  SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    return data;
  }
}
