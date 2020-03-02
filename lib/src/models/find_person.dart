import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
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

  void changePictures() async{
    try{
      List<Asset> _pictures = await MultiImagePicker.pickImages(
        maxImages: 4,
        selectedAssets: _person.picturesAssets
      );
      List<Uint8List> _newPictures = [];
      for(Asset pic in _pictures){
        ByteData byteData = await pic.getByteData();
        Uint8List imageData = byteData.buffer.asUint8List();
        _newPictures.add(imageData);
      }
      _person.pictures = List.from(_newPictures);
      _person.picturesAssets = List.from(_pictures);

      notifyListeners();
    } on Exception catch (e) {
      print(e);
    }
  }
}