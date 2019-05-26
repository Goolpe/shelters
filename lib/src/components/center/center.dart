import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:shelters/src/blocs/blocs.dart';
import 'package:shelters/src/widgets/widgets.dart';

class CenterSh extends StatelessWidget {
  final List<String> petsList = ['Все животные', 'Кошки', 'Собаки', 'Птицы', 'Грызуны', 'Полный список'];
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int i) {
          return Card(
            child: Text('lool')
          );
        },
      )
    );
  }
}
