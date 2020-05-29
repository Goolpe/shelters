import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shelters/index.dart';

class NavigationProvider extends ChangeNotifier{

  bool _isMenu = true;
  bool get isMenu => _isMenu;

  String _activeTitle = 'Adoption';
  String get activeTitle => _activeTitle;

  String _prevTitle = 'Add pet';
  String get prevTitle => _prevTitle;

  openScreen(String newTitle){
    if(newTitle == 'Menu'){
      _isMenu = true;
      Get.back();
    } else{
      _isMenu = false;
      
      if(newTitle != _activeTitle){
        _prevTitle = _activeTitle;
        _activeTitle = newTitle;
      }

      Get.to(Hero(
        tag: _activeTitle,
        child: screenWidget(_activeTitle)
      ));
    }

    notifyListeners();
  }
  
  Widget screenWidget(String text){
    switch(text){
      case 'Adoption': return HomeScreen();
      case 'Add pet': return AddScreen();
      default: return HomeScreen();
      // case 'Donation': return AnimalsScreen();
      // case 'Donation': return LostScreen();
      // case 'Donation': return ProfileScreen();
    }
  }
}