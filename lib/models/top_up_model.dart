import 'package:qrcode_pay/models/data_model.dart';

class TopUpModel {
  int? userId;
  int? topUpAmount;
  int? topUpStatusId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? id;
  String? topUpCode;

  TopUpModel({
    this.userId,
    this.topUpAmount,
    this.topUpStatusId,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.topUpCode,
  });

  factory TopUpModel.fromJson(Map<String, dynamic> json) {
    return TopUpModel(
      userId: json['userId'] ?? 0,
      topUpAmount: json['topUpAmount'] ?? 0,
      topUpStatusId: json['topUpStatusId'] ?? 0,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
      id: json['id'] ?? 0,
      topUpCode: json['topUpCode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId.toString(),
      'topUpAmount': topUpAmount.toString(),
      'topUpStatusId': topUpStatusId.toString(),
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
      'id': id.toString(),
      'topUpCode': topUpCode.toString(),
    };
  }
}
