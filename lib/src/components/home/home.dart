import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:shelters/src/blocs/blocs.dart';
import 'package:shelters/src/widgets/widgets.dart';

class HomeSh extends StatelessWidget {
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
            ? CustomGridSh(url: 'https://www.flashnews.bg/wp-content/uploads/2018/11/5654150584307663008b4ed8-750-563.jpg')
            : CustomListSh(url: 'https://www.flashnews.bg/wp-content/uploads/2018/11/5654150584307663008b4ed8-750-563.jpg')
          ],
        );
      }
    );
  }
}
