import 'package:flutter/cupertino.dart';

class CarouselProvider with ChangeNotifier{
  int _index = 0;
  int get index => _index;
  
  void changeIndex(int newIndex){
    _index = newIndex;
    notifyListeners();
  }
}
