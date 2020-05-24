import 'package:flutter/material.dart';
import 'package:shelters/index.dart';

class AnimalsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text('Shelters', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
        ),
        GridView.count( 
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 3,
          children: List.generate(100, (index) {
            return Container(
              margin: EdgeInsets.all(8),
              child: SheltersHomeImage(id: index)
            );
          }),
        ),
      ],
    );
  }
}