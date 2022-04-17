class SignInResponseModel {
  bool? success;
  String? userID;
  String? type;
  String? walletAddress;
  String? token;

  SignInResponseModel(
      {this.success, this.userID, this.type, this.walletAddress, this.token});

  SignInResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    userID = json['userID'];
    type = json['type'];
    walletAddress = json['walletAddress'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['userID'] = this.userID;
    data['type'] = this.type;
    data['walletAddress'] = this.walletAddress;
    data['token'] = this.token;
    return data;
  }
}
