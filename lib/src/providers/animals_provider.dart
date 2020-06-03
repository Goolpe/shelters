import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shelters/index.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AnimalsProvider with ChangeNotifier{

  final PanelController _filterController = PanelController();
  PanelController get filterController => _filterController;

  List<Animal> _dataList = [];
  List<Animal> get dataList => _dataList;

  List<Animal> _allData = [];

  final List<String> genus = ['All','Cats','Dogs','Birds'];

  final List<String> gender = ['All','Male','Female'];

  final List<String> title = ['All','Favorites','Yours'];

  final List<int> _conditions = [0,0,0];
  List<int> get conditions => _conditions;

  List<int> _tempConditions = [0,0,0];
  List<int> get tempConditions => _tempConditions;

  Future<void> init() async{
    String _dataJson = await fetchJson('animals');
    List<dynamic> _newDataList = json.decode(_dataJson) as List<dynamic>;

    _newDataList.forEach((dynamic _allDataMap){
      _allData.add(Animal.fromJson(_allDataMap));
    });
    
    _dataList = List.from(_allData);

    notifyListeners();
  }

  void updateData(int filterIndex, int index){
    _tempConditions[filterIndex] = index;
    notifyListeners();
  }

  void cancelData(){
    _tempConditions = List.from(_conditions);
    notifyListeners();
  }

  void update(){
    for(int i = 0; i < _conditions.length; i++){
      _conditions[i] = _tempConditions[i];
    }

    _dataList.clear();
    for(int i = 0; i < _allData.length; i++){
      if(_conditions[0] != 0){
        if(_allData[i].genus != genus[_conditions[0]]){
          continue;
        };
      }
      if(_conditions[1] != 0){
        if(_allData[i].gender != gender[_conditions[1]]){
          continue;
        };
      }
      _dataList.add(_allData[i]);
    }
    notifyListeners();
  }
}