// lib/domain/mixins/top_up_validator_mixin.dart

mixin TopUpValidatorMixin {
  // Validates if the top-up amount is within the user's balance
  bool isAmountValidForBalance(double amount, double balance) {
    return amount <= balance;
  }

  // Validates if the top-up amount does not exceed the monthly limit per beneficiary
  bool isTopUpAmountValidForVerification(
      double amount, bool isVerified, double totalTopUpForBeneficiary) {
    double maxLimit = isVerified ? 1000.0 : 500.0;
    return totalTopUpForBeneficiary + amount <= maxLimit;
  }

  // Validates if the total top-up amount across all beneficiaries is within the monthly limit
  bool isTotalTopUpAmountValid(double totalTopUpForAllBeneficiaries, double amount) {
    return totalTopUpForAllBeneficiaries + amount <= 3000.0;
  }

  // Validates if the user has enough balance to cover the transaction fee
  bool isBalanceEnough(double amount, double balance, double transactionFee) {
    return (amount + transactionFee) <= balance;
  }
}
