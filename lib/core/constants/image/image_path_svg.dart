

import '../../extensions/string_extensions.dart';

class SVGImagePaths {
  static SVGImagePaths? _instance;
  static SVGImagePaths? get instance {
   return _instance ??= SVGImagePaths.init();
  }

  SVGImagePaths.init();

  final walkingSVG = 'walking_outside'.toSVG;
  final bugsSVG = 'corpo_bugs'.toSVG;
  final alienSVG = 'corpo_alien'.toSVG;
  final loginGirlSVG = 'login_girl'.toSVG;
}
