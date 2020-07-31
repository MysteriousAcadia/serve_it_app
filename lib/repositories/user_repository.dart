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

  Future<bool> isSignedIn() async {
    var currentUser = await _fAuth.currentUser();
    var token = await currentUser.getIdToken();
    if (currentUser == null || currentUser.isAnonymous) {
      return false;
    }
    return true;
  }

  Future<FirebaseUser> getCurrentUser() async {
    var currentUser = await _fAuth.currentUser();
    return currentUser;
  }

//Email password login
  Future<FirebaseUser> createNewUser(String email, String password) async {
    try {
      var result = await _fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return (result.user);
    } catch (e) {
      throw e;
    }
  }

  Future<FirebaseUser> signInWithEmail(String email, String password) async {
    var result = await _fAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<String> signInWithGoogle() async {
    _facebookSignIn.logOut();
    _googleSignIn.signOut();
    _fAuth.signOut();
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    try {
      final AuthResult authResult =
          await _fAuth.signInWithCredential(credential);
          user = authResult.user;
    print(authResult.user);
    return 'signInWithGoogle succeeded: $user';
    } catch (e) {
      throw e;
    }
    
  }

  Future<String> signInWithFacebook() async {
    _facebookSignIn.logOut();
    _googleSignIn.signOut();
    _fAuth.signOut();
    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    final FacebookLoginResult result =
        await _facebookSignIn.logInWithReadPermissions(['email']);
    AuthCredential authCredential = FacebookAuthProvider.getCredential(
        accessToken: result.accessToken.token);

    user = (await _fAuth.signInWithCredential(authCredential)).user;

    final FirebaseUser currentUser = await _fAuth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInWithFacebook succeeded: $user';
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _facebookSignIn.logOut();
    await _fAuth.signOut();
  }
}
