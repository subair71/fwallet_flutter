import 'package:equatable/equatable.dart';

abstract class TopUpState extends Equatable {
  const TopUpState();

  @override
  List<Object?> get props => [];
}

class TopUpInitial extends TopUpState {}

class TopUpLoading extends TopUpState {}

class TopUpSuccess extends TopUpState {}

class TopUpError extends TopUpState {
  final String message;

  const TopUpError(this.message);

  @override
  List<Object?> get props => [message];
}


class TopUpLoaded extends TopUpState {
  final List<int> options;

  const TopUpLoaded(this.options);

  @override
  List<Object?> get props => [options];
}
