import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  //Google Sign in
  signInWithGoogle() async {
    //begin interaction sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth request from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //finally, let's sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}