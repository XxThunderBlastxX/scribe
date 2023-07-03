import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/auth_repository.dart';
import '../../../data/repository/document_repository.dart';
import '../../../data/services/data_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>((event, emit) => emit(HomeInitialState()));

    on<HomeSignOutEvent>((event, emit) async {
      await dataService.get<AuthRepository>().signOut();
      emit(HomeSignOutState());
    });

    on<CreateNewDocumentEvent>((event, emit) async {
      emit(HomeLoadingState());
      await dataService.get<DocumentRepository>().createDocument();
      emit(HomeInitialState());
    });
  }
}
