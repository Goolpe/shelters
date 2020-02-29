import 'package:flutter/material.dart';
import 'package:shelters/shelf.dart';

class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimalsList()
      ]
    );
  }
}