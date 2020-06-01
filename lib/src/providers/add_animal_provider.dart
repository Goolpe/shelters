import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:shelters/index.dart';

class AddAnimalProvider with ChangeNotifier{
  TextEditingController _nameController;
  TextEditingController get nameController => _nameController;

  TextEditingController _breedController;
  TextEditingController get breedController => _breedController;

  TextEditingController _colorController;
  TextEditingController get colorController => _colorController;

  TextEditingController _heightController;
  TextEditingController get heightController => _heightController;

  TextEditingController _weightController;
  TextEditingController get weightController => _weightController;

  TextEditingController _commentController;
  TextEditingController get commentController => _commentController;

  String _gender = 'Gender';
  String get gender => _gender;

  String _genus = 'Genus';
  String get genus => _genus;

  DateTime _birthday;
  DateTime get birthday => _birthday;

  String _age = 'Age';
  String get age => _age;

  String _name;
  String get name => _name;

  String _breed;
  String get breed => _breed;

  String _color;
  String get color => _color;
  
  String _height;
  String get height => _height;
  
  String _weight;
  String get weight => _weight;

  String _comment;
  String get comment => _comment;

  DateTime _tempDate;

  final List<String> pets = <String>[
    'Cats',
    'Dogs',
    'Birds',
    'Other',
  ];

  final List<String> genders = <String>['Male', 'Female'];

  void init(){
    _nameController = TextEditingController(text: _name);
    _breedController = TextEditingController(text: _breed);
    _colorController = TextEditingController(text: _color);
    _heightController = TextEditingController(text: _height);
    _weightController = TextEditingController(text: _weight);
    _commentController = TextEditingController(text: _comment);
  }

  void changeName(String newName){
    _name = newName;
    notifyListeners();
  }

  void changeBreed(String newBreed){
    _breed = newBreed;
    notifyListeners();
  }

  void changeColor(String newColor){
    _color = newColor;
    notifyListeners();
  }

  void changeHeight(String newHeight){
    _height = newHeight;
    notifyListeners();
  }

  void changeWeight(String newWeight){
    _weight = newWeight;
    notifyListeners();
  }

  void changeComment(String newComment){
    _comment = newComment;
    notifyListeners();
  }

  void changeTempDate(DateTime newDate){
    _tempDate = newDate;
  }

  Future<void> changeDate() async{
    if(_tempDate == null){
      _tempDate = DateTime.now();
    }
    _birthday = _tempDate;
    _age = timeago.format(_birthday);

    Get.back();
    notifyListeners();
  }

  void changeGender(String newGender){
    _gender = newGender;
    Get.back();
    notifyListeners();
  }

  void changeGenus(String newGenus){
    _genus = newGenus;
    Get.back();
    notifyListeners();
  }

  void createPet(){
    if(
      _gender != 'Gender' &&
      _color.trim().isNotEmpty && 
      _genus != 'Genus'
    ){
      _gender = 'Gender';
      _genus = 'Genus';
      _age = 'Age';
      _birthday = null;
      _name = null;
      _breed = null;
      _color = null;
      _height = null;
      _weight = null;
      _comment = null;

      _nameController?.clear();
      _breedController?.clear();
      _colorController?.clear();
      _heightController?.clear();
      _weightController?.clear();
      _commentController?.clear();

      notifyListeners();
      showToast(label: 'Done');
    } else{
      showToast(label: 'Please, fill in the fields', error: true);
    }
  }

  @override
  void dispose() {
    _nameController?.dispose();
    _breedController?.dispose();
    _colorController?.dispose();
    _heightController?.dispose();
    _weightController?.dispose();
    _commentController?.dispose();
    super.dispose();
  }
}