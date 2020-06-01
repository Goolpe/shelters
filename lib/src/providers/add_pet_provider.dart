import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class AddPetProvider with ChangeNotifier{
  TextEditingController _nameController;
  TextEditingController get nameController => _nameController;

  TextEditingController _breedController;
  TextEditingController get breedController => _breedController;

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
    _gender = 'Gender';
    _genus = 'Genus';
    _age = 'Age';
    _birthday = null;
    _name = null;
    _breed = null;
    _comment = null;

    _nameController?.clear();
    _breedController?.clear();
    _commentController?.clear();

    notifyListeners();
  }

  @override
  void dispose() {
    _nameController?.dispose();
    _breedController?.dispose();
    _commentController?.dispose();
    super.dispose();
  }
}