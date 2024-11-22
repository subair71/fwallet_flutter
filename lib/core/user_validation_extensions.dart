// // Extensions for user-specific validation logic.

// extension BalanceValidation on User {
//   bool isAmountValidForBalance(double amount) {
//     return amount <= balance;
//   }

//   bool isBalanceEnoughForTransaction(double amount, double transactionFee) {
//     return (amount + transactionFee) <= balance;
//   }
// }

// extension TopUpValidation on User {
//   bool isTopUpLimitValid(double amount, bool isVerified, double totalTopUpForBeneficiary) {
//     double maxLimit = isVerified ? 1000.0 : 500.0;
//     return (totalTopUpForBeneficiary + amount <= maxLimit);
//   }

//   bool isTotalTopUpLimitValid(double totalTopUpForAllBeneficiaries, double amount) {
//     return (totalTopUpForAllBeneficiaries + amount <= 3000.0);
//   }
// }
