mixin BeneficiaryTopUpRules {
  static const int maxTopUpPerBeneficiary = 1000;
  static const int maxTotalTopUp = 3000;

  bool canTopUpBeneficiary({
    required bool isVerified,
    required double amountToTopUp,
  }) {
    if (!isVerified) return false;
    return amountToTopUp <= maxTopUpPerBeneficiary;
  }

  bool canTopUpAllBeneficiaries({
    required bool isVerified,
    required double amountToTopUp,
  }) {
    if (!isVerified) return false;
    return amountToTopUp <= maxTotalTopUp;
  }
}
