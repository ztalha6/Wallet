class HistoryResponseModel {
  bool? status;
  List<Result>? result;

  HistoryResponseModel({this.status, this.result});

  HistoryResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? sId;
  String? userId;
  int? debit;
  int? credit;
  String? description;
  String? depositId;
  String? currencyId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? transactionId;

  Result(
      {this.sId,
      this.userId,
      this.debit,
      this.credit,
      this.description,
      this.depositId,
      this.currencyId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.transactionId});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    debit = json['debit'];
    credit = json['credit'];
    description = json['description'];
    depositId = json['depositId'];
    currencyId = json['currencyId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    transactionId = json['transactionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['debit'] = this.debit;
    data['credit'] = this.credit;
    data['description'] = this.description;
    data['depositId'] = this.depositId;
    data['currencyId'] = this.currencyId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['transactionId'] = this.transactionId;
    return data;
  }
}
