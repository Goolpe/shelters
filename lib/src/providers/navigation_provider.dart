import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shelters/index.dart';

class NavigationProvider extends ChangeNotifier{

  bool _isMenu = true;
  bool get isMenu => _isMenu;

  String _activeTitle = 'Adoption';
  String get activeTitle => _activeTitle;

  openScreen(String newTitle){
    if(newTitle == 'Menu'){
      _isMenu = true;
      Get.back();
    } else{
      _isMenu = false;
      _activeTitle = newTitle;
      Get.to(_widget());
    }

    notifyListeners();
  }

  _widget(){
    switch(_activeTitle){
      case 'Adoption': return Hero(
        tag: 'HomeScreen',
        child: HomeScreen()
      );
      default: return Hero(
        tag: 'HomeScreen',
        child: HomeScreen()
      );
      // case 'Donation': return AnimalsScreen();
      // case 'Donation': return LostScreen();
      // case 'Donation': return ProfileScreen();
    }
  }
}