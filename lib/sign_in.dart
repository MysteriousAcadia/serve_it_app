import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _fAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final FacebookLogin facebookSignIn = new FacebookLogin();

Future<bool> isSignedIn() async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  if (user != null) {
    return true;
  } else {
    return false;
  }
}

Future<String> signInWithGoogle() async {
  facebookSignIn.logOut();
  googleSignIn.signOut();
  _fAuth.signOut();
  FirebaseUser user = await FirebaseAuth.instance.currentUser();

  if (user != null) {
    return 'Already signIn succeeded: $user';
  }
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _fAuth.signInWithCredential(credential);
  user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() == null);

  final FirebaseUser currentUser = await _fAuth.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}

Future<String> signInWithFacebook() async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  if (user != null) {
    return 'Already signIn succeeded: $user';
  }

  final FacebookLoginResult result =
      await facebookSignIn.logInWithReadPermissions(['email']);
  AuthCredential authCredential =
      FacebookAuthProvider.getCredential(accessToken: result.accessToken.token);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() == null);

  user = (await _fAuth.signInWithCredential(authCredential)).user;
  //Token: ${accessToken.token}

  final FirebaseUser currentUser = await _fAuth.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithFacebook succeeded: $user';
}

Future<Null> signOutWithFacebook() async {
  await facebookSignIn.logOut();
}
