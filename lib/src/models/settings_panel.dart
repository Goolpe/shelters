import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SettingsPanelModel with ChangeNotifier{
  PanelController _controller = PanelController();

  PanelController get controller => _controller;

  void open(){
    _controller.open();
    notifyListeners();
  }
}