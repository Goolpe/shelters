import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AnimalsListModel with ChangeNotifier{

  DatabaseReference _dbRef;
  
  List<dynamic> _data = [];
  List<dynamic> get data => _data;

  void init() async{
    _dbRef = FirebaseDatabase.instance.reference();
    notifyListeners();
  }

  void addData(){
    _dbRef.push().set({
      'title': 'Mastering EJB',
      'description': 'Programming Guide for J2EE'
    });
  }

  void getData(){
    _dbRef.once().then((DataSnapshot snapshot) {
      _data = snapshot.value;
      notifyListeners();
    });
  }
}