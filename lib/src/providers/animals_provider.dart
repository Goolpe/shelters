import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:shelters/index.dart';

class AnimalsProvider with ChangeNotifier{

  final PanelController _filterController = PanelController();
  PanelController get filterController => _filterController;

  List<Animal> _dataList = [];
  List<Animal> get dataList => _dataList;

  final _allPets = <Animal>[];

  List<int> _favoritePets = [];

  final List<String> genus = ['All','Cats','Dogs','Birds'];

  final List<String> gender = ['All','Male','Female'];

  final List<String> title = ['All','Favorites','Your'];

  final List<String> location = ['Saint-Petersburg, Russia', 'Moscow, Russia'];

  final List<int> _conditions = [0,0,0,0];
  List<int> get conditions => _conditions;

  List<int> _tempConditions = [0,0,0,0];
  List<int> get tempConditions => _tempConditions;

  SharedPreferences _shPreferences;
  int _userID;

  Future<void> init() async{
    _shPreferences = await SharedPreferences.getInstance();
    _userID = _shPreferences.getInt('userID') ?? 0;

    _fetchAnimals();
  }

  Future<void> _fetchAnimals() async{
    final _dataJson = await fetchJson('animals');
    final _newDataList = jsonDecode(_dataJson) as List<dynamic>;

    _newDataList.forEach((dynamic _allPetsMap){
      _allPets.add(Animal.fromJson(_allPetsMap));
    });

    _dataList = List.from(_allPets);
    notifyListeners();
  }

  void updateTempData(int filterIndex, int index){
    _tempConditions[filterIndex] = index;
    notifyListeners();
  }

  void cancelData(){
    _tempConditions = List.from(_conditions);
    notifyListeners();
  }

  void updateData(){
    for(int i = 0; i < _conditions.length; i++){
      _conditions[i] = _tempConditions[i];
    }

    _dataList.clear();
    _fetchFavorites();

    for(int i = 0; i < _allPets.length; i++){
      if(_conditions[0] != 0){
        if(_allPets[i].genus != genus[_conditions[0]]) 
        continue;
      }
      if(_conditions[1] != 0){
        if(_allPets[i].gender != gender[_conditions[1]]) 
        continue;
      }
      if(_conditions[2] != 0){
        if(_conditions[2] == 1){
          if(!_favoritePets.contains(_allPets[i].id)) 
          continue;
        } else{
          if(_allPets[i].userID != _userID) 
          continue;
        }
      }
      _dataList.add(_allPets[i]);
    }
    notifyListeners();
  }

  Future<void> _fetchFavorites() async{
    final _dataJson = await fetchJson('users');
    final _newDataList = jsonDecode(_dataJson) as List<dynamic>;
    
    for(int i = 0; i < _newDataList.length; i++){
      final _user = User.fromJson(_newDataList[i]);
      if(_user.id == _userID){
        _favoritePets = List.from(_user.favorites);
        break;
      }
    }
  }
}
