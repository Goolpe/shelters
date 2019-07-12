import 'package:flutter/material.dart';

import 'package:shelters/shelf.dart';

class MyPetsSh extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSh(title: 'Мои питомцы'),
      body: Center(
        child: Text(
          'Shelters',
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }
}