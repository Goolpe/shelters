import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shelters/shelf.dart';

class Navigation extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, int>(
      builder: (context, int state){
        return Scaffold(
          appBar: AppBar(
            title: Text('shelters', style: TextStyle(color: Colors.blueAccent)),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: Icon(MdiIcons.settings, color: Colors.black),
                onPressed: () => BlocProvider.of<SettingsPanelBloc>(context).add(SettingsPanelOpened()),
              )
            ],
          ),
          body: [
            HomeScreen(),
            FindScreen(),
            HomeScreen(),
            FindScreen(),
            HomeScreen()
          ][state],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            onTap: (int value) => BlocProvider.of<NavigationBloc>(context).add(value),
            currentIndex: state,
            selectedItemColor: Colors.blue,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('home'),
              )
            ]
          ),
        );
      }
    );
  }
}