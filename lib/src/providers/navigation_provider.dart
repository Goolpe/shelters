import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shelters/index.dart';

class NavigationProvider extends ChangeNotifier{

  //pets screen id 1
  int _activeId = 1;
  int get activeId => _activeId;

  //settings screen id 6
  int _prevId = 6;
  int get prevId => _prevId;

  Widget _activeWidget = PetsScreen();
  Widget get activeWidget => _activeWidget;

  Widget _prevWidget = SettingsScreen();
  Widget get prevWidget => _prevWidget;

  void openScreen(int id, Widget widget){

    Get.to<Widget>(Hero(
      tag: 'nav_$id',
      child: widget
    ));
      
    if(id != _activeId){
      _prevId = _activeId;
      _prevWidget = _activeWidget;

      _activeId = id;
      _activeWidget = widget;
    }

    notifyListeners();
  }
}