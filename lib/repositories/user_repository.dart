import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  FirebaseAuth _fAuth;
  GoogleSignIn _googleSignIn;
  FacebookLogin _facebookSignIn;

  UserRepository() {
    this._fAuth = FirebaseAuth.instance;
    this._googleSignIn = GoogleSignIn();
    this._facebookSignIn = new FacebookLogin();
  }

  Future<FirebaseUser> createNewUser(String email, String password) async {
    var result = await _fAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return (result.user);
  }

  Future<FirebaseUser> signInWithEmail(String email, String password) async {
    var result = await _fAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await _fAuth.signOut();
  }

  Future<bool> isSignedIn() async {
    var currentUser = await _fAuth.currentUser();
    return currentUser != null && !currentUser.isAnonymous;
  }

  Future<FirebaseUser> getCurrentUser() async {
    var currentUser = await _fAuth.currentUser();
    return currentUser;
  }
}
