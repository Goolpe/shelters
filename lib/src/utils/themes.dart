import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
  textTheme: TextTheme(
    subtitle1: TextStyle(color: Colors.white),
  ),
  appBarTheme: AppBarTheme(
    color: const Color(0xFF212121),
  )
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  textTheme: TextTheme(
    bodyText2: TextStyle(color: Colors.grey[700])
  )
);