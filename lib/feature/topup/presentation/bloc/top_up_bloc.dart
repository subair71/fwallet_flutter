import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:mpay/core/resources/failure/failure.dart';
import 'package:mpay/feature/topup/domain/usecase/get_topup_options.dart';
import 'package:mpay/feature/topup/domain/usecase/perform_topup.dart';
import 'package:mpay/feature/topup/presentation/bloc/top_up_event.dart';
import 'package:mpay/feature/topup/presentation/bloc/top_up_state.dart';

class TopUpBloc extends Bloc<TopUpEvent, TopUpState> {
  final GetTopUpOptions _getTopUpOptions;
  final PerformTopUp _performTopUp;

  TopUpBloc(this._getTopUpOptions,this._performTopUp) : super(TopUpInitial()) {
    on<GetTopUpOptionsEvent>((event, emit) async {
      emit(TopUpLoading());

      final Either<Failure, List<int>> result = _getTopUpOptions(event.balance);

      result.fold(
        (failure) => emit(TopUpError(failure.message)),
        (options) => emit(TopUpLoaded(options)),
      );
    });

    on<PerformTopUpEvent>((event, emit) async {
      emit(TopUpLoading());

      final Either<Failure, bool> result = await _performTopUp(event.params,event.params.amount);

      result.fold(
        (failure) => emit(TopUpError(failure.message)),
        (success) => emit(TopUpSuccess()),
      );
    });
  }
}
