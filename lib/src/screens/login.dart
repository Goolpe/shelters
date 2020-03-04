import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shelters/shelf.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RaisedButton(
        child: Text('Login with Google'),
        onPressed: () => Provider.of<AuthModel>(context, listen: false).handleSignIn(),
      )
    );
  }
}