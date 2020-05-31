import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelProvider extends ChangeNotifier{
  final PanelController _panelController = PanelController();
  PanelController get panelController => _panelController;

  void openPanel(){
    _panelController.isPanelOpen
    ? _panelController.close()
    : _panelController.open();
    notifyListeners();
  }

  void goToMap(){
    _panelController.close();
    notifyListeners();
  }
}