import 'package:flutter/material.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight get instance {
    return _instance ??= TextThemeLight.init();
  }

  TextThemeLight.init();

  final TextStyle headline1 = const TextStyle(
      fontSize: 35, fontWeight: FontWeight.bold, letterSpacing: -1.5);
  final TextStyle headline2 = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  final TextStyle headline3 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  final TextStyle headline4 = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  final TextStyle overline = const TextStyle(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5);
  final TextStyle bodyText1 = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.5);
  final TextStyle bodyText2 = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25);
}
