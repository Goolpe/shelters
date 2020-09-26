import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData _theme;
  ThemeData get theme => _theme;

  SharedPreferences _shPreferences;

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  Future<void> init(BuildContext context) async{
    
    _shPreferences = await SharedPreferences.getInstance();
    _darkTheme = _shPreferences.getBool('theme') ?? false;
    notifyListeners();
  }

  void changeTheme(context){
    _darkTheme = !_darkTheme;
    _shPreferences.setBool('theme', _darkTheme);
    notifyListeners();
  }
}
