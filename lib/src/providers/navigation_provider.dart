import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shelters/index.dart';

class NavigationProvider extends ChangeNotifier{
  
  String _title = 'Adoption';
  String get title => _title;

  Widget _screen = AnimalsScreen();
  Widget get screen => _screen;

  openScreen(String newTitle){
    _title = newTitle;
    // _screen = _choose();
    Get.to(_widget());
    notifyListeners();
  }

  openAnimalScreen(int id){
    _screen = LandscapeAnimalScreen(id: id);
    notifyListeners();
  }

  _widget(){
    switch(_title){
      case 'Adoption': return Hero(
        tag: 'HomeScreen',
        child: HomeScreen()
      );
      // case 'Donation': return AnimalsScreen();
      // case 'Donation': return LostScreen();
      // case 'Donation': return ProfileScreen();
    }
  }
}