import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeSh extends StatelessWidget {
  final List<String> petsList = ['Все животные', 'Кошки', 'Собаки', 'Птицы', 'Грызуны', 'Полный список'];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Card(
          child: ListTile(
            trailing: Icon(MdiIcons.magnify, color: Colors.cyan,),
            title: Text('Животные'),
            subtitle: Text('Питомцы, которые ищут дом'),
            onTap: () => Navigator.pushNamed(context, '/pets'),
          ),
        ),
        Card(
            child: ListTile(
              trailing: Icon(MdiIcons.dog, color: Colors.amber),
              title: Text('Потеряшки'),
              subtitle: Text('Найдем питомца вместе!'),
              onTap: () => Navigator.pushNamed(context, '/lost'),
            ),
          ),
          Card(
            child: ListTile(
              trailing: Icon(MdiIcons.dogSide, color: Colors.blue,),
              title: Text('Выставки'),
              subtitle: Text('Куда сходить, что посмотреть'),
              onTap: () => Navigator.pushNamed(context, '/exhibitions'),
            ),
          ),
          Card(
            child: ListTile(
              trailing: Icon(MdiIcons.heartCircleOutline, color: Colors.red,),
              title: Text('Донорство'),
              subtitle: Text('Спасти жизнь может каждый!'),
              onTap: () => Navigator.pushNamed(context, '/donor'),
            ),
          ),
      ]
    );
  }
}
