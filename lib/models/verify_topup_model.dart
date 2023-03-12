// class TopUpCode {
//   int id;
//   int userId;
//   String topupCode;
//   String topupAmount;
//   int? outletId;
//   int topupStatusId;
//   DateTime? topupDate;

//   TopUpCode({
//     required this.id,
//     required this.userId,
//     required this.topupCode,
//     required this.topupAmount,
//     this.outletId,
//     required this.topupStatusId,
//     this.topupDate,
//   });

//   factory TopUpCode.fromJson(Map<String, dynamic> json) {
//     return TopUpCode(
//       id: json['id'],
//       userId: json['user_id'],
//       topupCode: json['topup_code'],
//       topupAmount: json['topup_amount'],
//       outletId: json['outlet_id'],
//       topupStatusId: json['topup_status_id'],
//       topupDate: DateTime.parse(json['topup_date']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'user_id': userId,
//       'topup_code': topupCode,
//       'topup_amount': topupAmount,
//       'outlet_id': outletId,
//       'topup_status_id': topupStatusId,
//       'topup_date': topupDate?.toIso8601String(),
//     };
//   }
// }

import 'package:qrcode_pay/models/top_up_model.dart';

class VerifyTopupModel {
  String message;
  TopUp topup;

  VerifyTopupModel({
    required this.message,
    required this.topup,
  });

  factory VerifyTopupModel.fromJson(Map<String, dynamic> json) {
    return VerifyTopupModel(
      message: json['message'],
      topup: TopUp.fromJson(json['topup']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'topup': topup.toJson(),
    };
  }
}
