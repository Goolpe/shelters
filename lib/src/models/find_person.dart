import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:shelters/shelf.dart';

class FindPersonModel with ChangeNotifier{
  PersonModel _person = PersonModel();
  List<Asset> _oldPictures = [];

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
        selectedAssets: _oldPictures
      );

      _person.pictures = [];

      for(Asset pic in _pictures){
        PictureModel picture = PictureModel();

        ByteData byteData = await pic.getByteData();
        picture.id = pic.identifier;
        picture.uint8 = byteData.buffer.asUint8List();
        picture.asset = pic;
        _person.pictures.add(picture);
        _oldPictures.add(pic);
      }

      notifyListeners();
    } on Exception catch (e) {
      print(e);
    }
  }

  void removePicture(PictureModel picture) async{
    try{
      _person.pictures.remove(picture);
      _oldPictures.remove(picture.asset);

      notifyListeners();
    } on Exception catch (e) {
      print(e);
    }
  }
}