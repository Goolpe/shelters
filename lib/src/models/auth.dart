import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shelters/shelf.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthModel with ChangeNotifier{
  GoogleSignIn _googleSignIn;

  FirebaseAuth _auth;

  bool _authStatus = false;
  bool get authStatus => _authStatus;

  void init() async {
    _googleSignIn = GoogleSignIn();
    _auth = FirebaseAuth.instance;
    _authStatus = await _auth.currentUser() != null;
    notifyListeners();
  }

  Future<void> handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
  }
}