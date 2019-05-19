import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shelters/src/blocs/blocs.dart';

class SearchFilterSh extends StatelessWidget {
  SearchFilterSh({
    Key key, 
    @required this.sortBloc,
    @required this.stateSort
  }) : super(key:key);

  final SortBloc sortBloc;
  final bool stateSort;

  final List<String> petsList = ['Все животные', 'Кошки', 'Собаки', 'Птицы', 'Грызуны', 'Полный список'];

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('Вид:'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.view_list, color: !stateSort ? Colors.green : Colors.grey),
                onPressed: () => sortBloc.dispatch(SortEvent.list),
              ),
              IconButton(
                icon: Icon(Icons.dashboard, color: stateSort ? Colors.green : Colors.grey),
                onPressed: () => sortBloc.dispatch(SortEvent.grid),
              )
            ]
          )
        )
      ],
    );
  }
}
