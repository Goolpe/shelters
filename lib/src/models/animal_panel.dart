import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AnimalPanelModel with ChangeNotifier{
  PanelController _controller = PanelController();
  String _url = '';

  PanelController get controller => _controller;
  String get url => _url;

  void open(String data){
    _url = data;
    _controller.open();
    notifyListeners();
  }
}