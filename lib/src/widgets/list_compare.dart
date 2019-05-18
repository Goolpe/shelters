import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:shelters/src/blocs/blocs.dart';
import 'package:shelters/src/widgets/grid.dart';
import 'package:shelters/src/widgets/list.dart';
import 'package:shelters/src/widgets/search.dart';

class ListCompareSh extends StatelessWidget {
  ListCompareSh({
    Key key, 
    @required this.title
  }) : super(key:key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final SearchBloc searchBloc = BlocProvider.of<SearchBloc>(context);
    final SortBloc sortBloc = BlocProvider.of<SortBloc>(context);

    return BlocBuilder<SearchEvent, bool>(
      bloc: searchBloc,
      builder: (BuildContext context, bool stateSearch) {
        return BlocBuilder<SortEvent, bool>(
          bloc: sortBloc,
          builder: (BuildContext context, bool stateSort) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Scaffold(
                body: ListView(
                  children: <Widget>[
                    !stateSearch
                    ? ListTile(
                      title: Text(title),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          VerticalDivider(),
                          IconButton(
                            icon: Icon(MdiIcons.filterOutline),
                            onPressed: () => searchBloc.dispatch(SearchEvent.show),
                          )
                        ]
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
                    !stateSort
                    ? GridSh()
                    : ListSh()
                  ],
                )
              )
            );
          }
        );
      }
    );
  }
}