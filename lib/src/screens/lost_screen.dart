import 'package:flutter/material.dart';
import 'package:shelters/index.dart';

class LostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool _orientationPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    
    return Container(
      child: ListView(
        children: [
          Text('Did you lost your pet?', style: TextStyle(fontSize: 34)),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: _orientationPortrait ? 3 : 4,
            children: List.generate(100, (index) {
              return Container(
                margin: EdgeInsets.all(8),
                child: SheltersHomeImage(id: index)
              );
            }),
          ),
        ],
      )
    );
  }
}