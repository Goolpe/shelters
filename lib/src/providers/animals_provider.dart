import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shelters/index.dart';

class AnimalsProvider with ChangeNotifier{
  List<Animal> _dataList = [];
  List<Animal> get dataList => _dataList;

  Future<void> init() async{
    String _dataJson = await fetchJson();
    List<dynamic> _newDataList = json.decode(_dataJson) as List<dynamic>;
    _newDataList.forEach((dynamic _dataListMap){
      _dataList.add(Animal.fromJson(_dataListMap));
    });
  }
}