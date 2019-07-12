import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shelters/shelf.dart';

class ArticleSh extends StatelessWidget {
  ArticleSh({
    Key key, 
    this.text
  }) : super(key:key);

  final String text;
  final List<String> petsList = ['Все животные', 'Кошки', 'Собаки', 'Птицы', 'Грызуны', 'Полный список'];
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBarSh(
        title: 'Статья',
      ),
      body: Card(
        child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15, top: 10, right: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('#donor'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: (){},
                              ),
                              IconButton(
                                icon: Icon(Icons.share),
                                onPressed: (){},
                              )
                            ]
                          )
                        ]
                      ),
                      Divider(),
                      Text(text),
                  ]
                )
              ),
            ],
          
        ),
      )
    );
  }
}
