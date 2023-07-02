import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../model/failure/failure.dart';
import '../interface/auth_interface.dart';

class AuthRepository implements IAuth {
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    required GoogleSignIn googleSignIn,
  }) : _googleSignIn = googleSignIn;

  @override
  Future<(UserCredential?, Failure?)> googleSignIn() async {
    try {
      final GoogleSignInAccount? userAccount = await _googleSignIn.signIn();

      final GoogleSignInAuthentication? userAuth =
          await userAccount?.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: userAuth?.accessToken,
        idToken: userAuth?.idToken,
      );
      return (
        await FirebaseAuth.instance.signInWithCredential(credential),
        null
      );
    } on FirebaseAuthException catch (err) {
      return (null, Failure(message: err.code.toUpperCase()));
    } catch (err) {
      return (null, Failure(message: err.toString().toUpperCase()));
    }
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
