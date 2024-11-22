part of 'beneficiary_bloc.dart';

abstract class BeneficiaryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddBeneficiaryEvent extends BeneficiaryEvent {
  final BeneficiaryParams params;

  AddBeneficiaryEvent({required this.params});

  @override
  List<Object?> get props => [params];
}

class CheckBeneficiaryEvent extends BeneficiaryEvent {
  final BeneficiaryParams params;

  CheckBeneficiaryEvent({required this.params});

  @override
  List<Object?> get props => [params];
}

class GetAllBeneficiariesEvent extends BeneficiaryEvent {
  final String userId;

  GetAllBeneficiariesEvent({required this.userId});

  @override
  List<Object?> get props => [userId];
}
