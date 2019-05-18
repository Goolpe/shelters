import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shelters/src/widgets/navigation.dart';
import 'package:shelters/src/blocs/navigation_bloc.dart';

void main() => runApp(AppSh());

class AppSh extends StatefulWidget {
  @override
  _AppShState createState() =>  _AppShState();
}

class _AppShState extends State<AppSh> {
  final NavigationBloc _navigationBloc = NavigationBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shelters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<NavigationBloc>(
        bloc: _navigationBloc,
        child: NavigationSh(),
      ),
    );
  }

  @override
  void dispose() {
    _navigationBloc.dispose();
    super.dispose();
  }

}