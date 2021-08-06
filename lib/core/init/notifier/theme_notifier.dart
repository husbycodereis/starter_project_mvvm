import 'package:flutter/material.dart';

import '../../constants/enums/app_theme_enum.dart';
import '../theme/dark/app_theme_dark.dart';
import '../theme/light/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  AppThemeEnum _currenThemeEnum = AppThemeEnum.LIGHT;

  ThemeData get currentTheme => _currentTheme;
  AppThemeEnum get currenThemeEnum => _currenThemeEnum;

  void changeTheme() {
    if (_currenThemeEnum == AppThemeEnum.LIGHT) {
      _currenThemeEnum = AppThemeEnum.DARK;
      _currentTheme = AppThemeDark.instance.theme;
    } else {
      _currenThemeEnum = AppThemeEnum.LIGHT;
      _currentTheme = AppThemeLight.instance.theme;
    }
    notifyListeners();
  }
}
