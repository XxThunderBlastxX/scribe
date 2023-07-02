part of 'document_bloc.dart';

abstract class DocumentState extends Equatable {
  const DocumentState();
}

class DocumentInitialState extends DocumentState {
  @override
  List<Object> get props => [];
}

class DocumentLoadingState extends DocumentState {
  @override
  List<Object> get props => [];
}

class DocumentLoadedState extends DocumentState {
  final DocumentModel document;

  const DocumentLoadedState({required this.document});

  @override
  List<Object> get props => [document];
}
