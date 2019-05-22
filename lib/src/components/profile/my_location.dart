import 'package:flutter/material.dart';
import 'package:shelters/src/components/common/map.dart';
import 'package:shelters/src/widgets/widgets.dart';

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