import 'package:dartz/dartz.dart';
import 'package:mpay/core/resources/failure/failure.dart';
import 'package:mpay/feature/user/domain/entity/user_entity.dart';


abstract class UserRepository {
  Future<Either<Failure, User>> getUserDetails(String userId);
}
