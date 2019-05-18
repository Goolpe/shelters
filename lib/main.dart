import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelters/src/widgets/donor.dart';
import 'package:shelters/src/widgets/exhibitions.dart';
import 'package:shelters/src/widgets/lost.dart';

import 'package:shelters/src/widgets/navigation/navigation.dart';
import 'package:shelters/src/blocs/blocs.dart';
import 'package:shelters/src/widgets/shelters.dart';

void main() => runApp(AppSh());

class AppSh extends StatefulWidget {
  @override
  _AppShState createState() =>  _AppShState();
}

class _AppShState extends State<AppSh> {
  final NavigationBloc _navigationBloc = NavigationBloc();
  final SortBloc _sortBloc = SortBloc();
  final SearchBloc _searchBloc = SearchBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<NavigationBloc>(bloc: _navigationBloc),
        BlocProvider<SortBloc>(bloc: _sortBloc),
        BlocProvider<SearchBloc>(bloc: _searchBloc)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shelters',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryTextTheme: Theme
          .of(context)
          .primaryTextTheme
          .apply(bodyColor: Colors.black),
          primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(
            color: Colors.black
          ),
        ),
        onGenerateRoute: (RouteSettings settings){
          switch (settings.name){
            case '/shelters': 
              return _goTo(SheltersSh());
            case '/lost': 
              return _goTo(LostSh());
            case '/exhibitions':
              return _goTo(ExhibitionsSh());
            case '/donor': 
              return _goTo(DonorSh());
            default:
              return null;
          }
        },
        home:  NavigationSh(),
      ),
    );
  }

  @override
  void dispose() {
    _navigationBloc.dispose();
    _searchBloc?.dispose();
    _sortBloc?.dispose();
    super.dispose();
  }

  Route<dynamic> _goTo(StatelessWidget widget){
    return CupertinoPageRoute<dynamic>(
      builder: (BuildContext context) => widget
    );
  }
}