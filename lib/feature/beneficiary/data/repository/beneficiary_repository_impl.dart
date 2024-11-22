import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mpay/core/resources/failure/failure.dart';
import 'package:mpay/feature/beneficiary/data/data_source/beneficiary_remote_data_source.dart';
import 'package:mpay/feature/beneficiary/data/model/beneficiary_model.dart';
import 'package:mpay/feature/beneficiary/domain/entity/beneficiaru_entity.dart';
import 'package:mpay/feature/beneficiary/domain/repository/beneficiary_repository.dart';

class BeneficiaryRepositoryImpl implements BeneficiaryRepository {
  final BeneficiaryRemoteDataSource _beneficiaryRemoteDataSource;

  BeneficiaryRepositoryImpl(this._beneficiaryRemoteDataSource);

  @override
  Future<Either<Failure, List<Beneficiary>>> getAllBeneficiaries(
      String userId) async {
    try {
      final result =
          await _beneficiaryRemoteDataSource.getAllBeneficiaries(userId);
      final responseData = jsonDecode(result.response.data);

      if (responseData['success'] == true) {
        final beneficiariesData = responseData['beneficiaries'] as List;
        final beneficiaries = beneficiariesData
            .map((json) => BeneficiaryModel.fromJson(json).toDomain())
            .toList();
        print(responseData);
        return Right(beneficiaries);
      } else {
        return Left(ServerFailure("Failed to fetch beneficiaries"));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(e.error.toString()));
      }
      return Left(ServerFailure("Unexpected error"));
    }
  }
}
