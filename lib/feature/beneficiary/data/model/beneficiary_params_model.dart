import 'package:mpay/feature/beneficiary/domain/entity/beneficiary_params.dart';

class BeneficiaryParamsModel extends BeneficiaryParams {
  BeneficiaryParamsModel({
    required super.userId,
    required super.name,
    required super.nickname,
  });

  // Factory method for creating an instance from JSON
  factory BeneficiaryParamsModel.fromJson(Map<String, dynamic> json) {
    return BeneficiaryParamsModel(
      userId: json['userId'],
      name: json['name'],
      nickname: json['nickname'],
    );
  }

  // Method to convert the model instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'nickname': nickname,
    };
  }
}