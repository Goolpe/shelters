import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shelters/src/blocs/blocs.dart';

class SearchSh extends StatelessWidget {
  SearchSh({Key key, this.searchBloc}) : super(key:key);

  final SearchBloc searchBloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Найти'
            ),
            textInputAction: TextInputAction.search,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(MdiIcons.magnify),
                onPressed: () => searchBloc.dispatch(SearchEvent.show),
              ),
              VerticalDivider(),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => searchBloc.dispatch(SearchEvent.hide),
              )
            ]
          )
        ),
      ],
    );
  }
}