import 'package:dartz/dartz.dart';
import 'package:mpay/core/resources/failure/failure.dart';
import 'package:mpay/feature/topup/data/data_source/topup_remote_data_source.dart';
import 'package:mpay/feature/topup/data/model/topup_params_model.dart';
import 'package:mpay/feature/topup/domain/entity/topup_params.dart';
import 'package:mpay/feature/topup/domain/repository/topup_repository.dart';

class TopUpRepositoryImpl implements TopUpRepository {
  final TopUpRemoteDataSource _remoteDataSource;

  TopUpRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, bool>> performTopUp(TopUp params, String id) async {
    try {
      final topUpModel = TopUpModel(
        id: params.id,
        benId: params.benId,
        nickname: params.nickname,
        name: params.name,
        amount: params.amount,
        balance: params.balance
      );

      final result = await _remoteDataSource.performTopUp(
          topUpModel.toJson(), params.id);

      if (result.response.data['success'] == true) {
        return const Right(true);
      } else {
        return Left(ServerFailure("Top-up failed"));
      }
    } catch (e) {
      return Left(ServerFailure("Failed to perform top-up"));
    }
  }
}
