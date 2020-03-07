import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelters/shelf.dart';
class ThemeModel with ChangeNotifier{
  ThemeModel(this._themeData);

  ThemeData _themeData;
  ThemeData get themeData => _themeData;

  Future<void> changeData() async{
    _themeData = _themeData == darkTheme ? lightTheme : darkTheme;
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('theme', _themeData == lightTheme);
  }
}