part of 'document_bloc.dart';

abstract class DocumentEvent extends Equatable {
  const DocumentEvent();
}

class DocumentInitialEvent extends DocumentEvent {
  final String id;

  const DocumentInitialEvent({required this.id});

  @override
  List<Object> get props => [];
}
