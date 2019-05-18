import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shelters/src/blocs/blocs.dart';
import 'package:shelters/src/widgets/grid.dart';
import 'package:shelters/src/widgets/list.dart';
import 'package:shelters/src/widgets/search.dart';

class ListCompareSh extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final SearchBloc searchBloc = BlocProvider.of<SearchBloc>(context);

    return BlocBuilder<SearchEvent, bool>(
      bloc: searchBloc,
      builder: (BuildContext context, bool stateSearch) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            body: ListView(
              children: <Widget>[
                !stateSearch
                ? ListTile(
                  title: Text('Новые питомцы'),
                  trailing: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => searchBloc.dispatch(SearchEvent.show)
                  )
                )
                : SearchSh(searchBloc: searchBloc),
                AnimatedCrossFade(
                  firstChild: ListTile(
                    title: FlatButton(
                      color: Colors.grey[300],
                      child: Text('Параметры поиска'),
                      onPressed: (){},
                    )
                  ),
                  secondChild: Container(height: 0),
                  duration: Duration(milliseconds: 300),
                  crossFadeState: stateSearch
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond
                ),
                GridSh(),
                ListSh()
              ],
            )
          )
        );
      }
    );
  }
}