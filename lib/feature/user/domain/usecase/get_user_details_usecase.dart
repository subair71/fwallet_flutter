import 'package:dartz/dartz.dart';
import 'package:mpay/core/resources/failure/failure.dart';
import 'package:mpay/core/usecases/usecase.dart';
import 'package:mpay/feature/user/domain/repository/user_repository.dart';

import '../entity/user_entity.dart';

class GetUserDetails implements   UseCase<Either<Failure, User>, String> {
  final UserRepository repository;

  GetUserDetails(this.repository);
  
  @override
  Future<Either<Failure, User>> call({String? params}) {
    return repository.getUserDetails(params??'');
  }
    
}
