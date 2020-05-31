import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shelters/index.dart';

class NavigationProvider extends ChangeNotifier{

  String _activeTitle = 'Pets';
  String get activeTitle => _activeTitle;

  String _prevTitle = 'Add pet';
  String get prevTitle => _prevTitle;

  void openScreen(String newTitle){
      
    if(newTitle != _activeTitle){
      _prevTitle = _activeTitle;
      _activeTitle = newTitle;
    }

    Get.to<Widget>(Hero(
      tag: _activeTitle,
      child: screenWidget(_activeTitle)
    ));

    notifyListeners();
  }

  Widget screenWidget(String text){
    switch(text){
      case 'Pets': return HomeScreen(title: text);
      case 'Add pet': return AddScreen();
      case 'Favorites': return HomeScreen(title: text);
      case 'Settings': return SettingsScreen();
      default: return HomeScreen();
    }
  }
}