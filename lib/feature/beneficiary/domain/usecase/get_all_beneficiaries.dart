
import 'package:dartz/dartz.dart';
import 'package:mpay/core/resources/failure/failure.dart';
import 'package:mpay/core/usecases/usecase.dart';
import 'package:mpay/feature/beneficiary/domain/entity/beneficiaru_entity.dart';
import 'package:mpay/feature/beneficiary/domain/repository/beneficiary_repository.dart';


class GetAllBeneficiaries implements   UseCase<Either<Failure, List<Beneficiary>>, String> {
  final BeneficiaryRepository repository;

  GetAllBeneficiaries(this.repository);
  
  @override
  Future<Either<Failure, List<Beneficiary>>> call({String? params}) {
    return repository.getAllBeneficiaries(params??'');
  }
    
}
