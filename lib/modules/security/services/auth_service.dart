import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? currentUser;

  // Autenticar com email e senha
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      currentUser = userCredential.user;
      return currentUser;
    } catch (e) {
      printError(info: e.toString());
      rethrow;
    }
  }

  // Autenticar com o Google
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      print(googleSignInAccount);

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        currentUser = userCredential.user;
        return currentUser;
      }
      return null;
    } catch (e) {
      printError(info: e.toString()+"EROOOOO");
      rethrow;
    }
  }

  // Cadastrar usuário com email e senha
  Future<User?> creatUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      currentUser = userCredential.user;
      return currentUser;
    } catch (e) {
      printError(info: e.toString());
      rethrow;
    }
  }

  // Fazer logout
  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    currentUser = null;
  }
}
