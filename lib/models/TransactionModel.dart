class TransactionModel {
  String key; // transaction hash buyu id
  String date;
  String fromUid;
  String toUid;
  double amount;
  double fee;
  bool status;
  String
      transactionType; //systemToUser, userToUser, userToMongolChat, userToComplex.mn,userToEth, companyToUser etc.
  String description;

  TransactionModel({
    this.key,
    this.date,
    this.fromUid,
    this.toUid,
    this.amount,
    this.fee,
    this.status,
    this.transactionType,
    this.description,
  });
  toJson() {
    return {
      "key": key,
      "date": date,
      "fromUid": fromUid,
      "toUid": toUid,
      "amount": amount,
      "fee": fee ?? 0, //hoosn buyu system ees ogj bga bol fee baihgui
      "status": status ?? false,
      "transactionType": transactionType,
      "description": description ?? "хоосон",
    };
  }

  TransactionModel.fromJson(Map<dynamic, dynamic> map) {
    key = map['key'];
    date = map['date'];
    fromUid = map['fromUid'];
    toUid = map['toUid'];
    amount = map['amount'];
    fee = map['fee'];
    status = map['status'];
    transactionType = map['transactionType'];
    description = map['description'];
  }

  Map toMap() {
    var map = Map<String, dynamic>();
    map['key'] = this.key;
    map['date'] = this.date;
    map['fromUid'] = this.fromUid;
    map['toUid'] = this.toUid;
    map['amount'] = this.amount;
    map['fee'] = this.fee;
    map['status'] = this.status;
    map['transactionType'] = this.transactionType;
    map['description'] = this.description;
    return map;
  }
}
