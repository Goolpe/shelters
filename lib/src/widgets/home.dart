import 'package:flutter/material.dart';
import 'package:shelters/src/widgets/grid.dart';

class HomeSh extends StatelessWidget {
  final List<String> petsList = ['Все животные', 'Кошки', 'Собаки', 'Птицы', 'Грызуны', 'Полный список'];
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
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
          ListTile(
            title: Text('Найти питомцев'),
          ),
          GridSh(),
          Card(
            child: ListTile(
              leading: Icon(Icons.place),
              title: Text('Найти приют'),
            )
          )
        ],
      )
    );
  }
}
