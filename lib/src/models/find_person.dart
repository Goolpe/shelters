import 'package:flutter/material.dart';
import 'package:shelters/shelf.dart';

class FindPersonModel with ChangeNotifier{
  PersonModel _person = PersonModel();

  PersonModel get person => _person;

  void changeFirstName(String firstName){
    _person.firstName = firstName;
    notifyListeners();
  }

  void changeLastName(String lastName){
    _person.lastName = lastName;
    notifyListeners();
  }

  void changeDateOfBirth(DateTime dateOfBirth){
    _person.dateOfBirth = dateOfBirth;
    notifyListeners();
  }

  void changeDateOfLoss(DateTime dateOfLoss){
    _person.dateOfLoss = dateOfLoss;
    notifyListeners();
  }
}