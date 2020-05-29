import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shelters/index.dart';

class AnimalsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bool _orientationPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return GridView.count(
      crossAxisCount: _orientationPortrait ? 3 : 4,
      children: List.generate(100, (index) {
        return Container(
          margin: EdgeInsets.all(8),
          child: SheltersHomeImage(id: index)
        );
      }),
    );
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleSpacing: 0,
          title: Row(
            children: [
              if(_orientationPortrait)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text('Shelters', style: TextStyle(color: Colors.black, fontSize: 24),),
                ),
              Expanded(
                child: TabBar(
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(icon: Icon(Icons.dashboard)),
                    Tab(icon: Icon(MdiIcons.mapSearch)),
                  ],
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.count(
              crossAxisCount: _orientationPortrait ? 3 : 4,
              children: List.generate(100, (index) {
                return Container(
                  margin: EdgeInsets.all(8),
                  child: SheltersHomeImage(id: index)
                );
              }),
            ),
            Icon(Icons.directions_bike),
          ],
        ),
      )
    );
  }
}