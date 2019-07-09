import 'package:flutter/material.dart';
import 'package:shelters/src/screens/common/map.dart';
import 'package:shelters/src/components/components.dart';

class MyLocationSh extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSh(
        title: 'Местоположение',
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: MapSh()
    );
  }
}