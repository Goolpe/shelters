import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelProvider extends ChangeNotifier{
  PanelController _panelController = PanelController();
  PanelController get panelController => _panelController;

  int _id = 0;
  int get id => _id;

  openPanel(int newID){
    _id = newID;
    _panelController.open();
    notifyListeners();
  }

  goToMap(){
    _panelController.close();
    notifyListeners();
  }
}