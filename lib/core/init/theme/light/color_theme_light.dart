import 'package:flutter/material.dart';

class ColorThemeLight {
  static ColorThemeLight? _instance;
  static ColorThemeLight? get instance {
    return _instance ??= ColorThemeLight.init();
  }

  ColorThemeLight.init();

  final Color brown = const Color(0xffa87e6f);
  final Color red = const Color(0xFFCC2041);
  final Color white = const Color(0xffffffff);
  final Color grey = const Color(0xffF1F3F8);
  final Color lightGrey = const Color(0xffF1F3F8);
  final Color darkGrey = const Color(0xff676870);
  final Color black = const Color(0xff020306);
  final Color azure = const Color(0xff27928d);
  final Color orange = const Color(0xffD56B21);
  final Color yellow = const Color(0xffEBBC36);

  ColorScheme get colorScheme => ColorScheme(
      primary: red, //xx
      primaryVariant: red,
      secondary: azure, //xx
      secondaryVariant: orange, //xx
      surface: yellow,
      background: lightGrey, //xx
      error: Colors.red[900]!,
      onPrimary: Colors.greenAccent,
      onSecondary: Colors.black,
      onSurface: Colors.white30,
      onBackground: grey,
      onError: Colors.green,
      brightness: Brightness.light);
}
