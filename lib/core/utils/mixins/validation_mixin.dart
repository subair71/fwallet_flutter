mixin TopUpValidatorMixin {
  bool isAmountValidForBalance(double amount, double balance) {
    return amount <= balance;
  }

  bool isTopUpAmountValidForVerification(
      double amount, bool isVerified, double totalTopUpForBeneficiary) {
    double maxLimit = isVerified ? 1000.0 : 500.0;
    return totalTopUpForBeneficiary + amount <= maxLimit;
  }

  bool isTotalTopUpAmountValid(double totalTopUpForAllBeneficiaries, double amount) {
    return totalTopUpForAllBeneficiaries + amount <= 3000.0;
  }

  bool isBalanceEnough(double amount, double balance, double transactionFee) {
    return (amount + transactionFee) <= balance;
  }

  bool isNicknameValid(String nickname) {
    return nickname.length <= 20;
  }
}
