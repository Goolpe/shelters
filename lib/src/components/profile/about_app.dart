import 'package:flutter/material.dart';
import 'package:shelters/src/widgets/widgets.dart';

class AboutAppSh extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSh(title: 'О приложении'),
      body: Center(
        child: Text(
          'Shelters',
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }
}