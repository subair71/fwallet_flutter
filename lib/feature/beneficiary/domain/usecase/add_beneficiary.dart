import 'package:dartz/dartz.dart';
import 'package:mpay/core/resources/failure/failure.dart';
import 'package:mpay/core/usecases/usecase.dart';
import 'package:mpay/feature/beneficiary/domain/entity/beneficiaru_entity.dart';
import 'package:mpay/feature/beneficiary/domain/entity/beneficiary_params.dart';
import 'package:mpay/feature/beneficiary/domain/repository/beneficiary_repository.dart';

class AddBeneficiary
   implements UseCase<Either<Failure, List<Beneficiary>>, BeneficiaryParams> {
  final AddBeneficiaryRepository repository;

  AddBeneficiary(this.repository);

  @override
  Future<Either<Failure, List<Beneficiary>>> call({BeneficiaryParams? params}) async {
    
      return await repository.addBeneficiary(params!);
    
  }
}
