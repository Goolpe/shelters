import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shelters/shelf.dart';

class Navigation extends StatelessWidget{

  final List<IconData> _icons = [Icons.dashboard, Icons.home, Icons.search, Icons.home, Icons.home];

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
              _rightButtons(state, context)
            ],
          ),
          body: [
            HomeScreen(),
            FindScreen(),
            FindScreen(),
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
            items: _icons.map((IconData icon) => 
              BottomNavigationBarItem(
                icon: Icon(icon),
                title: Text('home'),
              ),
            ).toList()
          ),
        );
      }
    );
  }

  _rightButtons(int state, BuildContext context){
    if(state==0){
      return IconButton(
        icon: Icon(MdiIcons.settings, color: Colors.black),
        onPressed: () => BlocProvider.of<SettingsPanelBloc>(context).add(SettingsPanelOpened()),
      );
    }
    return SizedBox();
  }
}