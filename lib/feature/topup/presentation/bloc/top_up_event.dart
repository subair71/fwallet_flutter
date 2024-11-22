import 'package:equatable/equatable.dart';
import 'package:mpay/feature/topup/domain/entity/topup_params.dart';

abstract class TopUpEvent extends Equatable {
  const TopUpEvent();

  @override
  List<Object?> get props => [];
}

class GetTopUpOptionsEvent extends TopUpEvent {
  final int balance;

  const GetTopUpOptionsEvent(this.balance);

  @override
  List<Object?> get props => [balance];
}

class PerformTopUpEvent extends TopUpEvent {
  final TopUp params;

  const PerformTopUpEvent(this.params);

  @override
  List<Object?> get props => [params];
}
