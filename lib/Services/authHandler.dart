import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHandler {
  AuthHandler._init();
  static final AuthHandler instance = AuthHandler._init();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  Future signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );
      final result = await _auth.signInWithCredential(credential);
      return result.user?.uid;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  Future signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
