import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:shelters/shelf.dart';

class PetCardSh extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSh(title: 'Карточка питомца'),
      body: ListView(
        children: <Widget>[
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width * 2,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int i) {
                return Container(
                  height: 150,
                  width: 150,
                  child: InkWell(
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      child: CachedNetworkImage(
                        imageUrl: URL,
                        fit: BoxFit.cover,
                      )
                    ),
                    onTap: () => Navigator.push<dynamic>(
                      context, MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => PhotoGallerySh(
                          index: i,
                          itemCount: 3,
                        )
                      )
                    ),
                  ),
                );
              },
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).textTheme.title.color
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Кличка: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'Клеопатра'),
                        ],
                      ),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).textTheme.title.color
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Тип: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'Собака'),
                        ],
                      ),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).textTheme.title.color
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Порода: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'Йоркширский терьер'),
                        ],
                      ),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).textTheme.title.color
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Пол: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'мужской'),
                        ],
                      ),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).textTheme.title.color
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Цвет: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'черный'),
                        ],
                      ),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).textTheme.title.color
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Дополнительно: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae viverra purus'),
                        ],
                      ),
                    )
                  )
                ],
              )
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(MdiIcons.mapMarker),
                        ),
                        Text('Санкт-Петербург')
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(MdiIcons.cellphoneIphone),
                        ),
                        Text('+7 (999) 999-99-99')
                      ],
                    ),
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }
}
