import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../inteface/auth_inteface.dart';

class AuthRepository implements IAuth {
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    required GoogleSignIn googleSignIn,
  }) : _googleSignIn = googleSignIn;

  @override
  Future<UserCredential> googleSignIn() async {
    final GoogleSignInAccount? userAccount = await _googleSignIn.signIn();

    final GoogleSignInAuthentication? userAuth =
        await userAccount?.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: userAuth?.accessToken,
      idToken: userAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
