import '../../domain/entity/user_entity.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.isVerified,
    required super.monthlyLimitExceeded,
    required super.transactionFee,
    required super.balance,
    required super.beneficiaryMax,
    required super.beneficiaries,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    return UserModel(
      id: data['id'],
      isVerified: data['isVerified'],
      monthlyLimitExceeded: data['monthlyLimitExceeded'],
      transactionFee: (data['transactionFee'] as num).toDouble(),
      balance: (data['balance'] as num).toDouble(),
      beneficiaryMax: data['beneficiaryMax'],
      beneficiaries: (data['beneficiaries'] as List<dynamic>)
          .map((e) => BeneficiaryModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isVerified': isVerified,
      'monthlyLimitExceeded': monthlyLimitExceeded,
      'transactionFee': transactionFee,
      'balance': balance,
      'beneficiaryMax': beneficiaryMax,
      'beneficiaries': beneficiaries.map((e) => BeneficiaryModel.fromEntity(e).toJson()).toList(),
    };
  }
}

class BeneficiaryModel extends Beneficiary {
  const BeneficiaryModel({
    required super.id,
    required super.name,
    required super.nickname,
    required super.balance,
  });

  factory BeneficiaryModel.fromJson(Map<String, dynamic> json) {
    return BeneficiaryModel(
      id: json['benId'],
      name: json['name'],
      nickname: json['nickname'],
      balance: (json['balance'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'benId': id,
      'name': name,
      'nickname': nickname,
      'balance': balance,
    };
  }

  static BeneficiaryModel fromEntity(Beneficiary beneficiary) {
    return BeneficiaryModel(
      id: beneficiary.id,
      name: beneficiary.name,
      nickname: beneficiary.nickname,
      balance: beneficiary.balance,
    );
  }
}
