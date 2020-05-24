import 'package:flutter/material.dart';
import 'package:shelters/index.dart';

class AnimalScreen extends StatelessWidget {
  AnimalScreen({
    @required this.id,
    this.scrollController
  });

  final int id;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(16.0),
      child: ListView(
        controller: scrollController,
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16), bottom: Radius.zero),
              child: SheltersAnimalImage(id: id)
            )
          ),
          ListTile(
            title: Text('Pushok', style: TextStyle(fontSize: 24),),
          ),
          ListTile(
            title: Text('Sex', style: TextStyle(fontSize: 24),),
          ),
          ListTile(
            title: Text('Skin color', style: TextStyle(fontSize: 24),),
          ),
          ListTile(
            title: Text('Sex', style: TextStyle(fontSize: 24),),
          ),
          ListTile(
            title: Text('Skin color', style: TextStyle(fontSize: 24),),
          ),
          ListTile(
            title: Text('Skin color', style: TextStyle(fontSize: 24),),
          ),
          ListTile(
            title: Text('Sex', style: TextStyle(fontSize: 24),),
          ),
          ListTile(
            title: Text('Skin color', style: TextStyle(fontSize: 24),),
          ),
          ListTile(
            title: Text('Skin color', style: TextStyle(fontSize: 24),),
          ),
          ListTile(
            title: Text('Sex', style: TextStyle(fontSize: 24),),
          ),
          ListTile(
            title: Text('Skin color', style: TextStyle(fontSize: 24),),
          )
        ]
      )
    );
  }
}