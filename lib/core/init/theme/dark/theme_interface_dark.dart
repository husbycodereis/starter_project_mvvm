import 'color_theme_dark.dart';
import 'text_theme_dark.dart';

abstract class IDarkTheme {
  TextThemeDark? textThemeDark = TextThemeDark.instance;
  ColorThemeDark? colorThemeDark = ColorThemeDark.instance;
}
