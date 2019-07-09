import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SearchListSh extends StatelessWidget {
  final List<String> petsList = ['Все животные', 'Кошки', 'Собаки', 'Птицы', 'Грызуны', 'Полный список'];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        ListTile(
          title: Text('Новые питомцы')
        ),
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width * 2,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int i) {
              return Container(
                width: 150,
                child: Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      'https://www.flashnews.bg/wp-content/uploads/2018/11/5654150584307663008b4ed8-750-563.jpg',
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                    )
                  ),
                ),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            trailing: Icon(MdiIcons.magnify, color: Colors.green,),
            title: Text('Питомники'),
            subtitle: Text('Находите любимцев и друзей'),
            onTap: () => Navigator.pushNamed(context, '/shelters'),
          ),
        ),
        Card(
            child: ListTile(
              trailing: Icon(MdiIcons.dog, color: Colors.purple,),
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
