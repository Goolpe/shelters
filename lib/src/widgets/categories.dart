import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shelters/src/widgets/list_compare.dart';

class CategoriesSh extends StatelessWidget {
  final List<String> petsList = ['Все животные', 'Кошки', 'Собаки', 'Птицы', 'Грызуны'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Категории'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
      ),
      body: ListView(
        children: List.generate(petsList.length, (int i) {
          return Card(
            child: ListTile(
              title: Text(petsList[i]),
              onTap: () => Navigator.push<dynamic>(context, 
                CupertinoPageRoute<dynamic>(
                  builder: (BuildContext context) => ListCompareSh(title: petsList[i])
                )
              )
            ),
          );
        }),
      )
    );
  }
}
