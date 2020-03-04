import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shelters/shelf.dart';

class AnimalsListModel with ChangeNotifier{
  List<AnimalModel> _animals = [];

  List<AnimalModel> get animals => _animals;

  void fetchData() async {
    _animals = await AnimalModel.fetchAnimalList();
    notifyListeners();
  }
}