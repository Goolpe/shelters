import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenterSh extends StatelessWidget {
  final List<String> petsList = ['Все животные', 'Кошки', 'Собаки', 'Птицы', 'Грызуны', 'Полный список'];
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      // body: TinderSwapCard(
      //   totalNum: 10,
      //   cardBuilder: (context, index) => Card(
      //     child: Image.network('https://www.flashnews.bg/wp-content/uploads/2018/11/5654150584307663008b4ed8-750-563.jpg'),
      //   ),
      // )
    );
  }
}