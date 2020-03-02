
import 'dart:typed_data';

import 'package:multi_image_picker/multi_image_picker.dart';

class PersonModel{

  String firstName = '';
  String lastName = '';
  DateTime dateOfBirth;
  DateTime dateOfLoss;
  List<Uint8List> pictures = [];
  List<Asset> picturesAssets = [];

  PersonModel({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.dateOfLoss,
    this.pictures
  });
}