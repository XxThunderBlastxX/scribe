part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitialState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthFailureState extends AuthState {
  final Failure failure;

  const AuthFailureState({
    required this.failure,
  });

  @override
  List<Object?> get props => [failure];
}

class AuthSuccessState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}
