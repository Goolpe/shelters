import 'package:flutter/material.dart';
import 'package:shelters/src/widgets/widgets.dart';

class LoginSh extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text('lol'),
            onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
          )
        ],
      )
    );
  }
}