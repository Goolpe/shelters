import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FilterProvider extends ChangeNotifier{
  final PanelController _filterController = PanelController();
  PanelController get filterController => _filterController;

  void openFilter(){
    _filterController.isPanelOpen
    ? _filterController.close()
    : _filterController.open();
    notifyListeners();
  }

  void goToMap(){
    _filterController.close();
    notifyListeners();
  }
}