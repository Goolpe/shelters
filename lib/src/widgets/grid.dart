import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shelters/src/widgets/list_compare.dart';
import 'package:shelters/src/widgets/search.dart';

class GridSh extends StatelessWidget {
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
    );
  }
}
