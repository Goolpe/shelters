import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/shelf.dart';

class AnimalsScreen extends StatelessWidget{
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimalsNotifier>(
      builder: (context, AnimalsNotifier state, _){
        return Scaffold(
          body: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () => _refresh(context),
            child: state.list
            ? ListScreen(state: state)
            : MapScreen(state: state)
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(state.list ? MdiIcons.mapMarker : MdiIcons.viewDashboard),
            onPressed: () => Provider.of<AnimalsNotifier>(context, listen: false).changeScreen(),
          )
        );
      }
    );
  }

  Future<Null> _refresh(context) {
    Provider.of<AnimalsNotifier>(context, listen: false).getData();
    return Future.delayed(Duration(seconds: 1));
  }
}