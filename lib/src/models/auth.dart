import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthModel with ChangeNotifier{
  GoogleSignIn _googleSignIn;

  FirebaseAuth _auth;
  UserUpdateInfo _userUpdateInfo;

  bool _authLoading = false;
  bool get authLoading => _authLoading;

  FirebaseUser _user;
  FirebaseUser get user => _user;

  void init() async {
    _authLoading = true;
    notifyListeners();

    _googleSignIn = GoogleSignIn();
    _auth = FirebaseAuth.instance;
    _user = await _auth.currentUser();
    _userUpdateInfo = UserUpdateInfo();

    _authLoading = false;
    notifyListeners();
  }

  Future<void> handleSignIn() async {

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    _user = (await _auth.signInWithCredential(credential)).user;

    notifyListeners();
  }

  Future<void> logout() async{
    await FirebaseAuth.instance.signOut();
    _googleSignIn.signOut();
    init();
  }

  Future<void> updateName(String _name) async{
    _userUpdateInfo.displayName = _name;
    _updateProfile();
  }

  Future<void> _updateProfile() async{
    try{
      await _user.updateProfile(_userUpdateInfo);
      _user = await _auth.currentUser();
    } catch(err){
      print(err);
    }
    notifyListeners();
  }
}