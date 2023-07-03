import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../app/common/utils/uuid.dart';
import '../../model/failure/failure.dart';
import '../interface/document_interface.dart';

class DocumentRepository implements IDocument {
  final CollectionReference<Map<String, dynamic>> _collectionRef;

  DocumentRepository({
    required CollectionReference<Map<String, dynamic>> collectionRef,
  }) : _collectionRef = collectionRef;

  @override
  Future<Failure?> createDocument() async {
    try {
      final id = GenId.instance.getUid();

      Map<String, dynamic> data = {
        'id': id,
        'userId': FirebaseAuth.instance.currentUser!.uid,
        'title': 'Untitled',
        'data': QuillController.basic().document.toDelta().toJson(),
        'updatedAt': DateTime.now().toIso8601String(),
        'createdAt': DateTime.now().toIso8601String(),
      };

      await _collectionRef.doc(id).set(data).onError(
            (error, stackTrace) => throw Exception(error),
          );
      return null;
    } on FirebaseException catch (e) {
      return Failure(message: e.message!);
    } catch (e) {
      return Failure(message: e.toString());
    }
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>?> getDocumentById(
    String id,
  ) async {
    try {
      final doc = await _collectionRef.where('id', isEqualTo: id).get();
      return doc;
    } catch (e) {
      return throw Failure(message: e.toString());
    }
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>?> getDocuments() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> docSnapshot =
          await _collectionRef
              .where(
                'userId',
                isEqualTo: FirebaseAuth.instance.currentUser!.uid,
              )
              .get();
      return docSnapshot;
    } on FirebaseException catch (e) {
      return throw Failure(message: e.message!);
    } catch (e) {
      return throw Failure(message: e.toString());
    }
  }

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> streamDocument(String id) {
    return _collectionRef.doc(id).snapshots();
  }

  @override
  void updateDocument(String id, List<dynamic> data) {
    _collectionRef.doc(id).update({
      'data': data,
      'updatedAt': DateTime.now().toIso8601String(),
    });
  }
}
