import 'package:dartz/dartz.dart';
import 'package:mpay/core/resources/failure/failure.dart';
import 'package:mpay/feature/beneficiary/domain/entity/beneficiaru_entity.dart';
import 'package:mpay/feature/beneficiary/domain/entity/beneficiary_params.dart';


abstract class BeneficiaryRepository {
  Future<Either<Failure, List<Beneficiary>>> getAllBeneficiaries(String userId);
}

abstract class AddBeneficiaryRepository{
  Future<Either<Failure, List<Beneficiary>>> addBeneficiary(BeneficiaryParams params);
}
