import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/shelf.dart';

class Navigation extends StatelessWidget{

  final List<IconData> _icons = [Icons.dashboard, Icons.home, Icons.search, Icons.home, Icons.home];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationModel>(
      builder: (context, state, _){
        return Scaffold(
          appBar: AppBar(
            title: Text('shelters', style: TextStyle(color: Colors.blueAccent)),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              _rightButtons(state.index, context)
            ],
          ),
          body: [
            HomeScreen(),
            FindScreen(),
            FindScreen(),
            FindScreen(),
            FindScreen(),
          ][state.index],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            onTap: (int value) => Provider.of<NavigationModel>(context, listen: false).change(value),
            currentIndex: state.index,
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
        onPressed: () => Provider.of<SettingsPanelModel>(context, listen: false).open(),
      );
    }
    return SizedBox();
  }
}