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

  final Map<int, Widget> genders = <int, Widget>{
    0: Container(
      height: 50,
      alignment: Alignment.center,
      child: Text("All", style: TextStyle(fontSize: 18))
    ),
    1: Container(
      height: 50,
      alignment: Alignment.center,
      child: Text("Male", style: TextStyle(fontSize: 18))
    ),
    2: Container(
      height: 50,
      alignment: Alignment.center,
      child: Text("Female", style: TextStyle(fontSize: 18))
    ),
  };

  int _genderNow = 0;
  int get genderNow => _genderNow;

  int _genusNow = 0;
  int get genusNow => _genusNow;

  Future<void> init() async{
    String _dataJson = await fetchJson('animals');
    List<dynamic> _newDataList = json.decode(_dataJson) as List<dynamic>;
    _newDataList.forEach((dynamic _allDataMap){
      _allData.add(Animal.fromJson(_allDataMap));
    });
    _dataList = List.from(_allData);
    notifyListeners();
  }

  void genusUpdate(int index){
    _genusNow = index;
    update();
  }

  void genderUpdate(int index){
    _genderNow = index;
    update();
  }

  void update(){
    _dataList = List.from(_allData.where((Animal element) =>
      gender[_genderNow] == element.gender &&
      genus[_genusNow] == element.genus
    ));
    notifyListeners();
  }

  void openPanel(){
    _filterController.open();
    notifyListeners();
  }

  void closePanel(){
    _filterController?.close();
    notifyListeners();
  }
}