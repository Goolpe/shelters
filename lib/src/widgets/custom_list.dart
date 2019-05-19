import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListSh extends StatelessWidget {
  CustomListSh({
    Key key, 
    this.url,
  }) : super(key:key);

  final String url;
  final List<String> petsList = ['Все животные', 'Кошки', 'Собаки', 'Птицы', 'Грызуны', 'Полный список'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int i) {
        return Container(
          width: 150,
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                url,
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              )
            ),
          ),
        );
      },
    );
  }
}
