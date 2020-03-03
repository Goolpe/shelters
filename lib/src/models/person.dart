import 'package:shelters/shelf.dart';

class PersonModel{

  String firstName = '';
  String lastName = '';
  DateTime dateOfBirth;
  DateTime dateOfLoss;
  List<PictureModel> pictures = [];

  PersonModel({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.dateOfLoss,
    this.pictures
  });
}