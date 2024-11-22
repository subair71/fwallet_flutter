import 'package:dartz/dartz.dart';
import 'package:mpay/core/resources/failure/failure.dart';
import 'package:mpay/core/usecases/usecase.dart';
import 'package:mpay/core/utils/mixins/validation_mixin.dart';
import 'package:mpay/feature/beneficiary/domain/entity/beneficiaru_entity.dart';
import 'package:mpay/feature/beneficiary/domain/entity/beneficiary_params.dart';
import 'package:mpay/feature/beneficiary/domain/repository/beneficiary_repository.dart';

class CheckBeneficiary
    with TopUpValidatorMixin
    implements UseCase<Either<Failure, List<Beneficiary>>, BeneficiaryParams> {
  final BeneficiaryRepository repository;

  CheckBeneficiary(this.repository);

  @override
  Future<Either<Failure, List<Beneficiary>>> call({BeneficiaryParams? params}) async {
    if (params == null) {
      return Left(ClientFailure('Beneficiary parameters cannot be null.'));
    }

    if (!isNicknameValid(params.nickname)) {
      return Left(ClientFailure('Nickname cannot be longer than 20 characters.'));
    }

    try {
      return await repository.getAllBeneficiaries(params.userId);
    } catch (e) {
      return Left(ServerFailure('Failed to Check beneficiary: $e'));
    }
  }
}
