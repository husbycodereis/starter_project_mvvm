import 'package:flutter/material.dart';
import '../app_theme.dart';
import 'theme_interface_light.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
      fontFamily: '',
      colorScheme: colorThemeLight!.colorScheme,
      primaryColor: colorThemeLight!.azure, //changes the color of focused label text in textfield
      backgroundColor: colorThemeLight!.lightGrey,
      scaffoldBackgroundColor: colorThemeLight!.lightGrey,
      inputDecorationTheme: inputDecorationTheme(),
      appBarTheme: appBarTheme(),
      iconTheme: iconTheme(),
      tabBarTheme: tabBarTheme(),
      textTheme: textTheme(),
      bottomNavigationBarTheme: bottomNavigationBarTheme());

  InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      focusColor: colorThemeLight!.black,
      labelStyle: textThemeLight!.bodyText1,
      hintStyle: textThemeLight!.bodyText1,
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorThemeLight!.azure)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorThemeLight!.azure)),
    );
  }

  AppBarTheme appBarTheme() => AppBarTheme(color: colorThemeLight!.colorScheme.primary, iconTheme: iconTheme());

  IconThemeData iconTheme() => IconThemeData(color: colorThemeLight!.black);

  TabBarTheme tabBarTheme() => TabBarTheme(
      labelColor: colorThemeLight!.orange,
      labelStyle: textThemeLight!.bodyText1,
      unselectedLabelStyle: textThemeLight!.bodyText2,
      unselectedLabelColor: colorThemeLight!.darkGrey,
      indicator: BoxDecoration(border: Border(bottom: BorderSide(width: 2, color: colorThemeLight!.orange))));

  TextTheme textTheme() => TextTheme(
        headline1: textThemeLight!.headline1,
        headline2: textThemeLight!.headline2,
        headline3: textThemeLight!.headline3,
        headline4: textThemeLight!.headline4,
        bodyText1: textThemeLight!.bodyText1,
        bodyText2: textThemeLight!.bodyText2,
        overline: textThemeLight!.overline,
      );

  BottomNavigationBarThemeData bottomNavigationBarTheme() => BottomNavigationBarThemeData(
      backgroundColor: colorThemeLight!.lightGrey, selectedItemColor: colorThemeLight!.orange);
}
