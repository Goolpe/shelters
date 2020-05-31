import 'package:flutter/cupertino.dart';

class CarouselProvider with ChangeNotifier{
  int _index = 0;
  int get index => _index;

  final List<String> images = <String>[
    'https://news.cgtn.com/news/77416a4e3145544d326b544d354d444d3355444f31457a6333566d54/img/37d598e5a04344da81c76621ba273915/37d598e5a04344da81c76621ba273915.jpg',
    'https://www.interfax.ru/ftproot/textphotos/2019/05/17/700gc.jpg'
  ];

  void changeIndex(int newIndex){
    _index = newIndex;
    notifyListeners();
  }
}