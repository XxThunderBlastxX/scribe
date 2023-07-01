import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuth {
  Future<UserCredential> googleSignIn();

  Future<void> signOut();
}
