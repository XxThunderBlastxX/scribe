part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeInitialEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeSignOutEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}
