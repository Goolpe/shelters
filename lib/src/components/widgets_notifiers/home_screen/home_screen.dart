import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shelters/shelf.dart';

class HomeScreen extends StatelessWidget{

  final List<IconData> _icons = [MdiIcons.viewDashboard, MdiIcons.plus, MdiIcons.chatOutline, MdiIcons.cogs];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Consumer<NavigationNotifier>(
            builder: (context, state, _){
              return Scaffold(
                appBar: AppBar(
                  title: Text('shelters', style: TextStyle(color: Colors.blueAccent)),
                  centerTitle: true,
                  elevation: 0,
                  actions: <Widget>[
                    _rightButtons(state.index, context)
                  ],
                ),
                body: [
                  AnimalsScreen(),
                  CreateScreen(),
                  ChatsScreen(),
                  ProfileScreen(),
                ][state.index],
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
                  onTap: (int value) => Provider.of<NavigationNotifier>(context, listen: false).change(value),
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
          ),
          AnimalPanel(),
          SettingsPanel()
        ]
      )
    );
  }

  _rightButtons(int state, BuildContext context){
    if(state==0){
      return IconButton(
        icon: Icon(MdiIcons.tune),
        onPressed: () => Provider.of<SettingsPanelNotifier>(context, listen: false).open(),
      );
    }
    return SizedBox();
  }
}