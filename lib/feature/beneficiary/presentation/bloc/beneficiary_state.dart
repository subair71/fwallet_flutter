part of 'beneficiary_bloc.dart';

abstract class BeneficiaryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BeneficiaryInitial extends BeneficiaryState {}

class BeneficiaryLoading extends BeneficiaryState {}

class BeneficiaryAdded extends BeneficiaryState {
  // final List<Beneficiary> beneficiaries;

  // BeneficiaryAdded({required this.beneficiaries});

  // @override
  // List<Object?> get props => [beneficiaries];
}

class BeneficiaryChecked extends BeneficiaryState {
  final bool isVerified;

  BeneficiaryChecked({required this.isVerified});

  @override
  List<Object?> get props => [isVerified];
}

class AllBeneficiariesLoaded extends BeneficiaryState {
  final List<Beneficiary> beneficiaries;

  AllBeneficiariesLoaded({required this.beneficiaries});

  @override
  List<Object?> get props => [beneficiaries];
}

class BeneficiaryError extends BeneficiaryState {
  final String message;

  BeneficiaryError({required this.message});

  @override
  List<Object?> get props => [message];
}
