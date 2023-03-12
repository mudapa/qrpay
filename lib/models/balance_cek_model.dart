class BalanceCekModel {
  int? id;
  int? balance;
  int? userId;

  BalanceCekModel({
    this.id,
    this.balance,
    this.userId,
  });

  factory BalanceCekModel.fromJson(Map<String, dynamic> json) {
    return BalanceCekModel(
      id: json['id'] ?? 0,
      balance: json['balance'] ?? 0,
      userId: json['userId'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'balance': balance.toString(),
      'userId': userId.toString(),
    };
  }
}
