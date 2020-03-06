import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shelters/shelf.dart';

class AnimalsListModel with ChangeNotifier{

  DatabaseReference _dbRef;
  
  List<AnimalModel> _animals = [];
  List<AnimalModel> get animals => _animals;

  void init() async{
    _dbRef = FirebaseDatabase.instance.reference();
    getData();
  }

  void getData(){
    _dbRef.once().then((DataSnapshot snapshot) {
      Map<String, dynamic> _dataMap = Map<String, dynamic>.from(snapshot.value);
      List<dynamic> _dataValues = _dataMap.values.toList();
      List<dynamic> _dataKeys = _dataMap.keys.toList();

      for(int i = 0; i < _dataValues.length; i++){
        _animals.add(AnimalModel.fromJson(_dataValues[i], _dataKeys[i]));
      }
    });
  }
}