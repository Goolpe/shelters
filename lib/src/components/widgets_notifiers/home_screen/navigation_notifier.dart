import 'package:flutter/material.dart';

class NavigationNotifier with ChangeNotifier{

  int _index = 0;
  int get index => _index;

  void change(int data){
    _index = data;
    notifyListeners();
  }
}