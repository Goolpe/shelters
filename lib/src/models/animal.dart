import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shelters/shelf.dart';

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

  static Future<List<AnimalModel>> fetchAnimalList() async{
    http.Response result = await http.get('https://api.thecatapi.com/v1/images/search?limit=15&format=json',
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': API_KEY
      }
    );
    if(result.statusCode == 200){
      List<AnimalModel> list = [];
      List<dynamic> _parsedJson = json.decode(result.body);

      for(int i=0;i<_parsedJson.length;i++){
        list.add(AnimalModel.fromJson(_parsedJson[i]));
      }

      return list;
    } else{
      throw Exception('Failed to load post');
    }
  }
}

