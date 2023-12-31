import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/failure/failure.dart';

abstract class IDocument {
  Future<Failure?> createDocument();

  Future<QuerySnapshot<Map<String, dynamic>>?> getDocuments();

  Future<QuerySnapshot<Map<String, dynamic>>?> getDocumentById(String id);

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamDocument(String id);

  void updateDocument(String id, List<dynamic> data);
}
