import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:shelters/src/widgets/list_compare.dart';

class HomeSh extends StatelessWidget {
  final List<String> petsList = ['Все животные', 'Кошки', 'Собаки', 'Птицы', 'Грызуны', 'Полный список'];
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(
            trailing: Icon(MdiIcons.cat, color: Colors.blue,),
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
            trailing: Icon(MdiIcons.magnify, color: Colors.green,),
            title: Text('Найти питомцев'),
          ),
          GridView.count(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(petsList.length, (int i) {
              return Card(
                child: InkWell(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: Text(petsList[i], softWrap: true, textAlign: TextAlign.center,),
                  ),
                  onTap: () => Navigator.push<dynamic>(context, 
                    CupertinoPageRoute<dynamic>(
                      builder: (BuildContext context) => ListCompareSh(title: petsList[i])
                    )
                  )
                ),
              );
            }),
          ),
          ListTile(
            trailing: Icon(MdiIcons.mapSearchOutline, color: Colors.amber),
            title: Text('Потеряшки'),
          ),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width * 2,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int i) {
                if(i == 0){
                  return Container(
                    width: 150,
                    child: Card(
                      child: InkWell(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(MdiIcons.pencilPlusOutline),
                              Text('Я потерял питомца', softWrap: true, textAlign: TextAlign.center,),
                            ]
                          )
                        ),
                        onTap: () => Navigator.push<dynamic>(context, 
                          CupertinoPageRoute<dynamic>(
                            builder: (BuildContext context) => ListCompareSh(title: petsList[i])
                          )
                        )
                      ),
                    ),
                  );
                }
                return Container(
                  width: 150,
                  child: Card(
                    child: InkWell(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          'https://www.flashnews.bg/wp-content/uploads/2018/11/5654150584307663008b4ed8-750-563.jpg',
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                        )
                      )
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}
