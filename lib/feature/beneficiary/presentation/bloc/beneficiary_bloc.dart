import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mpay/core/resources/failure/failure.dart';
import 'package:mpay/feature/beneficiary/domain/entity/beneficiaru_entity.dart';
import 'package:mpay/feature/beneficiary/domain/entity/beneficiary_params.dart';
import 'package:mpay/feature/beneficiary/domain/usecase/add_beneficiary.dart';
import 'package:mpay/feature/beneficiary/domain/usecase/check_beneficiary.dart';
import 'package:mpay/feature/beneficiary/domain/usecase/get_all_beneficiaries.dart';

part 'beneficiary_event.dart';
part 'beneficiary_state.dart';

class BeneficiaryBloc extends Bloc<BeneficiaryEvent, BeneficiaryState> {
  final AddBeneficiary addBeneficiaryUseCase;
  final CheckBeneficiary checkBeneficiaryUseCase;
  final GetAllBeneficiaries getAllBeneficiariesUseCase;

  BeneficiaryBloc({
    required this.addBeneficiaryUseCase,
    required this.checkBeneficiaryUseCase,
    required this.getAllBeneficiariesUseCase,
  }) : super(BeneficiaryInitial()) {
    on<AddBeneficiaryEvent>(_onAddBeneficiary);
    on<CheckBeneficiaryEvent>(_onCheckBeneficiary);
    on<GetAllBeneficiariesEvent>(_onGetAllBeneficiaries);
  }

  Future<void> _onAddBeneficiary(
      AddBeneficiaryEvent event, Emitter<BeneficiaryState> emit) async {
    emit(BeneficiaryLoading());
    final result = await checkBeneficiaryUseCase(params: event.params);
    result.fold(
      (failure) =>
          emit(BeneficiaryError(message: _mapFailureToMessage(failure))),
      (isVerified) async {
        emit(BeneficiaryAdded());
      },
    );
  }

  Future<void> _onCheckBeneficiary(
      CheckBeneficiaryEvent event, Emitter<BeneficiaryState> emit) async {
    emit(BeneficiaryLoading());
    final result = await checkBeneficiaryUseCase(params: event.params);
    result.fold(
      (failure) =>
          emit(BeneficiaryError(message: _mapFailureToMessage(failure))),
      (isVerified) async {
        final result = await addBeneficiaryUseCase(params: event.params);
      },
    );
  }

  Future<void> _onGetAllBeneficiaries(
      GetAllBeneficiariesEvent event, Emitter<BeneficiaryState> emit) async {
    emit(BeneficiaryLoading());
    final result = await getAllBeneficiariesUseCase(params: event.userId);
    result.fold(
      (failure) =>
          emit(BeneficiaryError(message: _mapFailureToMessage(failure))),
      (beneficiaries) =>
          emit(AllBeneficiariesLoaded(beneficiaries: beneficiaries)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return 'Server Failure';
    } else if (failure is ClientFailure) {
      return failure.message;
    } else {
      return 'Unexpected Error';
    }
  }
}
