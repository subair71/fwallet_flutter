class User {
  final String id;
  final bool isVerified;
  final bool monthlyLimitExceeded;
  final double transactionFee;
  final double balance;
  final int beneficiaryMax;
  final List<Beneficiary> beneficiaries;

  const User({
    required this.id,
    required this.isVerified,
    required this.monthlyLimitExceeded,
    required this.transactionFee,
    required this.balance,
    required this.beneficiaryMax,
    required this.beneficiaries,
  });
}

class Beneficiary {
  final String id;
  final String name;
  final String nickname;
  final double balance;

  const Beneficiary(
      {required this.id,
      required this.name,
      required this.nickname,
      required this.balance});
}
