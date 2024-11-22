
import 'package:dartz/dartz.dart';
import 'package:mpay/core/resources/failure/failure.dart';
import 'package:mpay/feature/beneficiary/data/data_source/beneficiary_remote_data_source.dart';
import 'package:mpay/feature/beneficiary/data/model/beneficiary_model.dart';
import 'package:mpay/feature/beneficiary/data/model/beneficiary_params_model.dart';
import 'package:mpay/feature/beneficiary/domain/entity/beneficiaru_entity.dart';
import 'package:mpay/feature/beneficiary/domain/entity/beneficiary_params.dart';
import 'package:mpay/feature/beneficiary/domain/repository/beneficiary_repository.dart';

class AddBeneficiaryRepositoryImpl implements AddBeneficiaryRepository {
  final BeneficiaryRemoteDataSource _remoteDataSource;

  AddBeneficiaryRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Beneficiary>>> addBeneficiary(BeneficiaryParams params) async {
    try {
      // If needed, convert BeneficiaryParams to BeneficiaryParamsModel
      final paramsModel = BeneficiaryParamsModel(
        userId: params.userId,
        name: params.name,
        nickname: params.nickname,
      );

      final result = await _remoteDataSource.addBeneficiary(paramsModel.toJson());
      final List<dynamic> data = result.response.data['data'];

      List<Beneficiary> beneficiaries = data
          .map((json) => BeneficiaryModel.fromJson(json))
          .toList();
      return Right(beneficiaries);
    } catch (e) {
      return Left(ServerFailure("Failed to add beneficiary"));
    }
  }
}

