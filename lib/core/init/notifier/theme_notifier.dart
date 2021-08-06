import 'package:flutter/material.dart';

import '../../constants/enums/app_theme_enum.dart';
import '../theme/app_theme_dark.dart';
import '../theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  AppThemes _currenThemeEnum = AppThemes.LIGHT;

  ThemeData get currentTheme => _currentTheme;
  AppThemes get currenThemeEnum => _currenThemeEnum;

  void changeTheme() {
    if (_currenThemeEnum == AppThemes.LIGHT) {
      _currenThemeEnum = AppThemes.DARK;
      _currentTheme = AppThemeDark.instance.theme;
    } else {
      _currenThemeEnum = AppThemes.LIGHT;
      _currentTheme = AppThemeLight.instance.theme;
    }
    notifyListeners();
  }
}
