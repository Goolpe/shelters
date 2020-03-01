import 'package:flutter/material.dart';

enum FindType {person, animal}

class FindModel with ChangeNotifier{
  FindType _findType = FindType.person;

  FindType get findType => _findType;

  void change(FindType type){
    _findType = type;
    notifyListeners();
  }
}