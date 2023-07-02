part of 'document_bloc.dart';

abstract class DocumentState extends Equatable {
  const DocumentState();
}

class DocumentInitial extends DocumentState {
  @override
  List<Object> get props => [];
}
