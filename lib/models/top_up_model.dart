class TopUp {
  String userId;
  String topUpAmount;
  int topUpStatusId;
  String updatedAt;
  String createdAt;
  int id;
  String topUpCode;

  TopUp({
    required this.userId,
    required this.topUpAmount,
    required this.topUpStatusId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.topUpCode,
  });

  factory TopUp.fromJson(Map<String, dynamic> json) {
    return TopUp(
      userId: json['user_id'] ?? "",
      topUpAmount: json['topup_amount'] ?? "",
      topUpStatusId: json['topup_status_id'] ?? 0,
      updatedAt: json['updated_at'] ?? "",
      createdAt: json['created_at'] ?? "",
      id: json['id'] ?? 0,
      topUpCode: json['topup_code'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'topup_amount': topUpAmount,
      'topup_status_id': topUpStatusId,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
      'topup_code': topUpCode,
    };
  }
}

class TopUpModel {
  String message;
  TopUp topup;
  String path;
  String topupCode;

  TopUpModel({
    required this.message,
    required this.topup,
    required this.path,
    required this.topupCode,
  });

  factory TopUpModel.fromJson(Map<String, dynamic> json) {
    return TopUpModel(
      message: json['message'] ?? "",
      topup: TopUp.fromJson(json['topup'] ?? {}),
      path: json['path'] ?? "",
      topupCode: json['topup_code'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'topup': topup.toJson(),
      'path': path,
      'topup_code': topupCode,
    };
  }
}
