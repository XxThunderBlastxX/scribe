import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/auth_repository.dart';
import '../../../data/services/data_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on((event, emit) => emit(AuthInitialState()));

    on<AuthSignInEvent>((event, emit) async {
      final UserCredential userCredential =
          await dataService.get<AuthRepository>().googleSignIn();

      if (userCredential.user == null) {
        emit(AuthFailureState());
      } else {
        emit(AuthSuccessState());
      }
    });
  }
}
