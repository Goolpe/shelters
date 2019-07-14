import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class CustomLocalizations {
  CustomLocalizations(this.locale);

  final Locale locale;

  static CustomLocalizations of(BuildContext context) {
    return Localizations.of<CustomLocalizations>(context, CustomLocalizations);
  }

  final Map<String, Map<String, String>> _localizedValues = <String, Map<String,String>>{
    'en': <String, String>{
      'apptTitle': 'Shelters',
    },
    'ru': <String, String>{
      'apptTitle': 'Приюты',
    },
  };

  String get apptTitle {
    return _localizedValues[locale.languageCode]['apptTitle'];
  }
}

class CustomLocalizationsDelegate extends LocalizationsDelegate<CustomLocalizations> {
  const CustomLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  Future<CustomLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of CustomLocalizations.
    return SynchronousFuture<CustomLocalizations>(CustomLocalizations(locale));
  }

  @override
  bool shouldReload(CustomLocalizationsDelegate old) => false;
}