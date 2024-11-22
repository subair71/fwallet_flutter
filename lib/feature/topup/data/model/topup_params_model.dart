
import 'package:mpay/feature/topup/domain/entity/topup_params.dart';

class TopUpModel extends TopUp {
  TopUpModel({
    required super.id,
    required super.name,
    required super.benId,
    required super.nickname,
    required super.amount,
    required super.balance,
  });

  factory TopUpModel.fromJson(Map<String, dynamic> json) {
    return TopUpModel(
      id: json['id'],
      name: json['name'],
      benId: json['benId'],
      nickname: json['nickname'],
      amount: json['amount'].toDouble(),
      balance: json['amount'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'benId': benId,
      'amount': amount,
    };
  }
}
