import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shelters/src/widgets/list_compare.dart';
import 'package:shelters/src/widgets/search.dart';

class GridSh extends StatelessWidget {
  GridSh({
    Key key, 
    this.url,
  }) : super(key:key);

  final String url;
  final List<String> petsList = ['Все животные', 'Кошки', 'Собаки', 'Птицы', 'Грызуны', 'Полный список'];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      children: List.generate(petsList.length, (int i) {
        return Card(
          child: InkWell(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                url,
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              )
            ),
            onTap: () => Navigator.push<dynamic>(context, 
              CupertinoPageRoute<dynamic>(
                builder: (BuildContext context) => ListCompareSh(title: petsList[i])
              )
            )
          ),
        );
      }),
    );
  }
}
