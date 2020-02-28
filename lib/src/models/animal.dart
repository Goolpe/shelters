import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shelters/shelf.dart';

class AnimalsModel{
  List<AnimalModel> list = [];
  
  AnimalsModel({
    this.list
  });

  AnimalsModel.fromJson(List<dynamic> _parsedJson){
    for(int i=0;i<_parsedJson.length;i++){
      list.add(AnimalModel.fromJson(_parsedJson[i]));
    }
  }

  Future<AnimalsModel> fetchAnimalList() async{
    http.Response result = await http.get('https://api.thecatapi.com/v1/images/search?limit=15&format=json',
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY
      }
    );
    if(result.statusCode == 200){
      return AnimalsModel.fromJson(json.decode(result.body));
    } else{
      throw Exception('Failed to load post');
    }
  }

}

class AnimalModel{
  final String id;
  final String url;
  
  AnimalModel({
    this.id,
    this.url
  });

  factory AnimalModel.fromJson(Map<String, dynamic> _parsedJson){
    return AnimalModel(
      id: _parsedJson['id'],
      url: _parsedJson['url']
    );
  }
}

