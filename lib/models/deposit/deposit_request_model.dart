class DepositBalanceRequestModel {
  String? currencyId;
  int? amount;
  String? userId;

  DepositBalanceRequestModel({this.currencyId, this.amount, this.userId});

  DepositBalanceRequestModel.fromJson(Map<String, dynamic> json) {
    currencyId = json['currencyId'];
    amount = json['amount'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currencyId'] = this.currencyId;
    data['amount'] = this.amount;
    data['userId'] = this.userId;
    return data;
  }
}
