import 'package:flutter/material.dart';
import 'package:shelters/shelf.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AnimalPanelNotifier with ChangeNotifier{
  PanelController _controller = PanelController();
  PanelController get controller => _controller;

  AnimalEntity _animal;
  AnimalEntity get animal => _animal;


  void open(AnimalEntity data){
    _animal = data;
    _controller.open();
    notifyListeners();
  }
}