import 'package:firebase_auth/firebase_auth.dart';

import '../../model/failure/failure.dart';

abstract class IAuth {
  Future<(UserCredential?, Failure?)> googleSignIn();

  Future<void> signOut();
}
