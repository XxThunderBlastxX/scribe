import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/failure/failure.dart';

abstract class IDocument {
  Future<Failure?> createDocument();

  Future<QuerySnapshot<Map<String, dynamic>>?> getDocuments();

  getDocumentById(String id);

  Future<Failure?> updateDocument(String id, String data);
}
