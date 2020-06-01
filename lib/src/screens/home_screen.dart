import 'package:flutter/material.dart';
import 'package:shelters/index.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {    
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          children: <Widget>[
            MenuScreen(),
            LoginScreen()
          ]
        )
      )
    );
  }
}