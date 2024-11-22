import 'package:dartz/dartz.dart';
import 'package:mpay/core/resources/failure/failure.dart';
import 'package:mpay/core/utils/extension/balance_extension.dart';

class GetTopUpOptions {
  Either<Failure, List<int>> call(int balance) {
    try {
      return Right(balance.getValidDenominations());
    } catch (e) {
      return Left(ClientFailure("Failed to fetch top-up options."));
    }
  }
}
