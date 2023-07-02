import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scribe/src/data/repository/document_repository.dart';

import '../repository/auth_repository.dart';

GetIt dataService = GetIt.instance;

void setupDataService() {
  dataService.registerLazySingleton(
      () => AuthRepository(googleSignIn: GoogleSignIn()));

  dataService.registerLazySingleton(() => DocumentRepository(
      collectionRef: FirebaseFirestore.instance.collection('document')));
}
