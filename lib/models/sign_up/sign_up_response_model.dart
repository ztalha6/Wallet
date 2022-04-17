class SignUpReponseModel {
  bool? alreadyExists;
  bool? status;
  String? message;

  SignUpReponseModel({this.alreadyExists, this.status, this.message});

  SignUpReponseModel.fromJson(Map<String, dynamic> json) {
    alreadyExists = json['alreadyExists'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alreadyExists'] = this.alreadyExists;
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
