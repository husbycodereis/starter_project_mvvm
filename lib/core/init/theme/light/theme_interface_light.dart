import 'color_theme_light.dart';
import 'text_theme_light.dart';

abstract class ILightTheme {
  TextThemeLight? textThemeLight = TextThemeLight.instance;
  ColorThemeLight? colorThemeLight = ColorThemeLight.instance;
}
