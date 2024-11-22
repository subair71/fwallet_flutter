import 'package:mpay/feature/beneficiary/domain/entity/beneficiaru_entity.dart';

class BeneficiaryModel extends Beneficiary {
  BeneficiaryModel({
    required super.id,
    required super.name,
    required super.nickname,
    required super.balance,
  });

  /// Factory method to create a BeneficiaryModel from JSON
  factory BeneficiaryModel.fromJson(Map<String, dynamic> json) {
    return BeneficiaryModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      nickname: json['nickname'] ?? '',
      balance: (json['balance'] ?? 0).toDouble(),
    );
  }

  /// Converts a BeneficiaryModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nickname': nickname,
      'balance': balance,
    };
  }

  Beneficiary toDomain() {
    return Beneficiary(
     id: id,
          name: name,
          nickname: nickname,
          balance: balance,
    );
  }
}
