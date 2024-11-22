
import 'package:dartz/dartz.dart';
import 'package:mpay/core/resources/failure/failure.dart';
import 'package:mpay/feature/topup/domain/entity/topup_params.dart';

abstract class TopUpRepository {
  Future<Either<Failure, bool>> performTopUp(TopUp params,String id);
}
