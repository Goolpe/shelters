import 'package:flutter/material.dart';
import 'package:shelters/shelf.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AnimalPanelModel with ChangeNotifier{
  PanelController _controller = PanelController();
  PanelController get controller => _controller;

  AnimalModel _animal;
  AnimalModel get animal => _animal;


  void open(AnimalModel data){
    _animal = data;
    _controller.open();
    notifyListeners();
  }
}