import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelters/index.dart';

class SettingsProvider with ChangeNotifier{

  final List<SheltersLocale> languages = <SheltersLocale>[
    SheltersLocale(
      language: 'English',
      locale: 'en',
    ),
    SheltersLocale(
      language: 'Русский',
      locale: 'ru',
    )
  ];

  SheltersLocale _currentLang = SheltersLocale(
    language: 'English',
    locale: 'en',
  );
  SheltersLocale get currentLang => _currentLang;

  void init(BuildContext context){
    _currentLang = languages.firstWhere(
      (SheltersLocale element) => 
      element.locale == FlutterI18n.currentLocale(context).toLanguageTag()
    );
  }

  Future<void> changeLanguage(SheltersLocale value, BuildContext context) async {
    Get.back();
    _currentLang = value;

    final SharedPreferences _shPreferences = await SharedPreferences.getInstance();
    _shPreferences.setString('locale', value.locale);

    await FlutterI18n.refresh(context, Locale(value.locale));
    notifyListeners();
  }
}