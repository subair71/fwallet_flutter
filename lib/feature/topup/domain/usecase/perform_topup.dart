// lib/domain/usecases/perform_top_up.dart

import 'package:dartz/dartz.dart';
import 'package:mpay/core/resources/failure/failure.dart';
import 'package:mpay/core/utils/mixins/topup_rule_mixin.dart';
import 'package:mpay/core/utils/mixins/validation_mixin.dart';
import 'package:mpay/feature/topup/domain/entity/topup_params.dart';
import 'package:mpay/feature/topup/domain/repository/topup_repository.dart';


class PerformTopUp   with TopUpValidatorMixin , BeneficiaryTopUpRules   {
 final TopUpRepository repository;

  PerformTopUp(this.repository);

  Future<Either<Failure, bool>> call(TopUp params, double amount) async {
    const transactionFee = 3.0;

    if (!isAmountValidForBalance(amount, params.balance)) {
      return Left(ClientFailure('Insufficient balance.'));
    }


    // double totalTopUpForBeneficiary = await repository.getTotalTopUpAmount(user.id, beneficiaryId);
    // if (!isTopUpAmountValidForVerification(amount, user.isVerified, beneficiary.totalTopUpForBeneficiary)) {
    //   return Left(ClientFailure('Exceeded top-up limit for this beneficiary.'));
    // }

    // // double totalTopUpForAllBeneficiaries = await repository.getTotalTopUpForAllBeneficiaries(user.id);
    // if (!isTotalTopUpAmountValid(user.totalTopUpForAllBeneficiaries, amount)) {
    //   return Left(ClientFailure('Exceeded total top-up limit for all beneficiaries.'));
    // }

    if (!isBalanceEnough(amount, params.balance, transactionFee)) {
      return Left(ClientFailure( 'Insufficient balance to cover the transaction fee.'));
    }

   final result = await repository.performTopUp(params, params.id);
if (result.isRight()) {
  return const Right(true);
} else {
  return Left(ClientFailure('An error occurred during the top-up.'));
}

  }
}
