import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:shelters/shelf.dart';

class PetsSh extends StatefulWidget {

  @override
  _PetsShState createState() => _PetsShState();
}

class _PetsShState extends State<PetsSh> {
  final PanelController _pc = PanelController();
  final SearchBloc _searchBloc = SearchBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      builder: (BuildContext context) => SearchBloc(),
      child: BlocBuilder<SearchEvent, bool>(
        bloc: _searchBloc,
        builder: (BuildContext context, bool stateSearch) {
          return Scaffold(
            appBar: CustomAppBarSh(
              title:'Животные',
              actions: <Widget>[
                Container(
                  width: 50,
                  child: InkWell(
                    child: Icon(stateSearch
                        ? MdiIcons.close 
                        : MdiIcons.filterOutline),
                    onTap: () =>
                      stateSearch
                      ? _pc.close()
                      : _pc.open()
                  )
                )
              ],
            ),
            body: SlidingUpPanel(
              onPanelOpened: () => _searchBloc.dispatch(SearchEvent.show),
              onPanelClosed: () => _searchBloc.dispatch(SearchEvent.hide),
              backdropEnabled: true,
              minHeight: 0,
              controller: _pc,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), 
                topRight: Radius.circular(15)
              ),
              panel: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: ListTile(
                  title: Text("This is the sliding Widget")
                ),
              ),
              body: Center(
                child: Text("This is the Widget behind the sliding panel"),
              ),
            ),
          );
        }
      )
    );
  }
}