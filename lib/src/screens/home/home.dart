import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeSh extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              trailing: Icon(MdiIcons.magnify, color: Colors.cyan,),
              title: const Text('Животные'),
              subtitle: const Text('Питомцы, которые ищут дом'),
              onTap: () => Navigator.pushNamed(context, '/pets'),
            ),
          ),
          Card(
            child: ListTile(
              trailing: Icon(MdiIcons.dog, color: Colors.amber),
              title: const Text('Потеряшки'),
              subtitle: const Text('Найдем питомца вместе!'),
              onTap: () => Navigator.pushNamed(context, '/lost'),
            ),
          ),
          Card(
            child: ListTile(
              trailing: Icon(MdiIcons.dogSide, color: Colors.blue,),
              title: const Text('Выставки'),
              subtitle: const Text('Куда сходить, что посмотреть'),
              onTap: () => Navigator.pushNamed(context, '/exhibitions'),
            ),
          ),
          Card(
            child: ListTile(
              trailing: Icon(MdiIcons.heartCircleOutline, color: Colors.red,),
              title: const Text('Донорство'),
              subtitle: const Text('Спасти жизнь может каждый!'),
              onTap: () => Navigator.pushNamed(context, '/donor'),
            ),
          ),
        ]
      )
    );
  }
}
