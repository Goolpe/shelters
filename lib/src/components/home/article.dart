import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:shelters/src/blocs/blocs.dart';
import 'package:shelters/src/widgets/widgets.dart';

class ArticleSh extends StatelessWidget {
  ArticleSh({
    Key key, 
    this.url,
    this.text
  }) : super(key:key);

  final String url;
  final String text;
  final List<String> petsList = ['Все животные', 'Кошки', 'Собаки', 'Птицы', 'Грызуны', 'Полный список'];
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBarSh(title: 'Статья'),
      body: Card(
        child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 80,
                width: 80,
                child: Image.network(
                  url
                )
              ),
              Container(
                margin: EdgeInsets.only(left: 15, top: 10, right: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Text('#donor'),
                      Divider(),
                      Text(text),
                  ]
                )
                
              )
            ],
          
        ),
      )
    );
  }
}
