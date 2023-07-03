import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../data/repository/document_repository.dart';
import '../../../data/services/data_service.dart';
import '../../../model/document/document.dart';

part 'document_event.dart';
part 'document_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  QuillController controller = QuillController(
    document: Document(),
    selection: const TextSelection.collapsed(offset: 0),
  );

  String docTitle = "";

  DocumentBloc() : super(DocumentInitialState()) {
    on<DocumentInitialEvent>(
      (event, emit) async {
        emit(DocumentLoadingState());
        final doc = await dataService
            .get<DocumentRepository>()
            .getDocumentById(event.id);

        docTitle = doc?.docs.first.data()['title'];

        final delta = Delta.fromJson(doc?.docs.first.data()['data']);

        if (delta.isEmpty) {
          controller = QuillController.basic();
        } else {
          controller = QuillController(
            document: Document.fromDelta(delta),
            selection: const TextSelection.collapsed(offset: 0),
          );
        }

        // await emit.onEach(
        //   dataService.get<DocumentRepository>().streamDocument(event.id),
        //   onData: (data) => controller.compose(
        //     Delta.fromJson(data.data()?['data']),
        //     const TextSelection.collapsed(offset: 0),
        //     ChangeSource.REMOTE,
        //   ),
        // );

        Timer.periodic(const Duration(seconds: 2), (timer) {
          controller.changes.listen((_) {
            dataService.get<DocumentRepository>().updateDocument(
                  event.id,
                  controller.document.toDelta().toJson(),
                );
          });
        });
      },
    );
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
