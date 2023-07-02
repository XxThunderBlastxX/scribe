import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/auth_repository.dart';
import '../../../data/services/data_service.dart';
import '../../../model/failure/failure.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on((event, emit) => emit(AuthInitialState()));

    on<AuthSignInEvent>((event, emit) async {
      emit(AuthLoadingState());
      final (UserCredential?, Failure?) _,
          failure = await dataService.get<AuthRepository>().googleSignIn();

      if (failure.$2 != null) {
        emit(AuthFailureState(failure: failure.$2!));
      } else {
        emit(AuthSuccessState());
      }
    });
  }
}
