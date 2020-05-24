import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shelters/index.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> with TickerProviderStateMixin<NavigationScreen> {
  int  _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _choose(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.paw),
            title: Text('')
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.alert),
            activeIcon: Icon(MdiIcons.alert, color: Colors.red),
            title: Text('')
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.accountCog),
            activeIcon: Icon(MdiIcons.accountCog, color: Colors.orange),
            title: Text('')
          ),
        ]
      ),
    );
  }
}

_choose(currentIndex){
  switch(currentIndex){
    case 0: return AnimalsScreen();
    case 1: return LostScreen();
    case 2: return ProfileScreen();
  }
}