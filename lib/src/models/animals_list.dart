import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shelters/shelf.dart';

class AnimalsListModel with ChangeNotifier{

  DatabaseReference _dbRef = FirebaseDatabase.instance.reference();
  
  List<AnimalModel> _animals = [];
  List<AnimalModel> get animals => _animals;

  bool _loading = false;
  bool get loading => _loading;

  bool _list = true;
  bool get list => _list;

  void init(){
    getData();
  }

  void getData() async{
    _loading = true;
    _animals = [];
    notifyListeners();

    DataSnapshot snapshot = await _dbRef.once();
    Map<String, dynamic> _dataMap = Map<String, dynamic>.from(snapshot.value);
    List<dynamic> _dataValues = _dataMap.values.toList();
    List<dynamic> _dataKeys = _dataMap.keys.toList();

    for(int i = 0; i < _dataValues.length; i++){
      _animals.add(AnimalModel.fromJson(_dataValues[i], _dataKeys[i]));
    }
    
    _loading = false;
    notifyListeners();
  }

  void changeScreen(){
    _list = !list;
    notifyListeners();
  }
}