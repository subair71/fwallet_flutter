import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mpay/core/resources/failure/failure.dart';
import 'package:mpay/feature/user/data/data_source/user_remote_datasource.dart';
import 'package:mpay/feature/user/data/model/user_model.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> getUserDetails(String userId) async {
    try {
      final result = await remoteDataSource.getUserDetails(userId);
      final Map<String, dynamic> data = jsonDecode(result.response.data);

      UserModel userModel = UserModel.fromJson(data);
      return Right(userModel);
    } catch (e) {
      return Left(ServerFailure("Server Failure"));
    }
  }
}
