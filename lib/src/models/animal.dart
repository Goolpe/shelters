import 'package:shelters/shelf.dart';

class AnimalModel{
  final String id;
  final String name;
  final List<dynamic> images;
  final String dateOfBirth;
  final String breed;
  final AnimalType type;
  
  AnimalModel({
    this.id,
    this.name,
    this.images,
    this.dateOfBirth,
    this.breed,
    this.type
  });

  factory AnimalModel.fromJson(Map<dynamic, dynamic> _parsedValue, _parsedKey){
    return AnimalModel(
      id: _parsedKey,
      name: _parsedValue['name'],
      type: animalTypes.firstWhere((element) => element.name == _parsedValue['type']),
      dateOfBirth: _parsedValue['dateOfBirth'],
      breed: _parsedValue['breed'],
      images: _parsedValue['images']
    );
  }
}

