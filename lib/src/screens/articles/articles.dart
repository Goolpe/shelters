import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:shelters/shelf.dart';

class ArticlesSh extends StatelessWidget {
  final List<String> petsList = ['Все животные', 'Кошки', 'Собаки', 'Птицы', 'Грызуны', 'Полный список'];
  
  @override
  Widget build(BuildContext context) {
    final SortBloc sortBloc = BlocProvider.of<SortBloc>(context);

    return BlocBuilder<SortEvent, bool>(
      bloc: sortBloc,
      builder: (BuildContext context, bool stateSort) {
        return ListView(
          shrinkWrap: true,
          children: <Widget>[
            ListTile(
              title: Text('Интересное'),
              subtitle: Text('Советы, статьи и не только'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(MdiIcons.viewList, size: 28, color: !stateSort ? Colors.green : Colors.grey),
                    onPressed: () => sortBloc.dispatch(SortEvent.list),
                  ),
                  IconButton(
                    icon: Icon(MdiIcons.viewDashboard, color: stateSort ? Colors.green : Colors.grey),
                    onPressed: () => sortBloc.dispatch(SortEvent.grid),
                  )
                ]
              ),
            ),
            stateSort
            ? CustomGridSh(url: URL)
            : CustomListSh(url: URL)
          ],
        );
      }
    );
  }
}
