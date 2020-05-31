import 'package:flutter/widgets.dart';

class SheltersIcon {
  SheltersIcon._();

  static const String _kFontFam = 'SheltersIcon';
  static const String _kFontPkg = null;

  static const IconData birds = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData cats = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData dogs = IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData menu = IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData all = IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  static IconData fromString(String title){
    switch(title){
      case 'Cats': return cats;
      case 'Dogs': return dogs;
      case 'Birds': return birds;
      default: return all;
    }
  }
}
