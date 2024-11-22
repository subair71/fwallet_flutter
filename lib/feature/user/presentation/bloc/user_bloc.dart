import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpay/feature/user/domain/usecase/get_user_details_usecase.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  final GetUserDetails _getUserDetails;

  UserBloc(
    this._getUserDetails,
  ) : super(UserInitial()) {
 
    on<FetchUserEvent>((event, emit) async {
      emit(UserLoading());
      final result = await _getUserDetails(params: event.userId);

      result.fold(
        (failure) => emit(UserError(failure.message)),
        (user) => emit(UserLoaded(user)),
      );
    });
  }
}
