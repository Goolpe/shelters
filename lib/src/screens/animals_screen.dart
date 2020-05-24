import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/index.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AnimalsScreen extends StatefulWidget {
  @override
  _AnimalsScreenState createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
      )
    );
  }
}