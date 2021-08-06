import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum LottiePathEnum { SUN, MOON }

extension LottiePathEnumExtension on LottiePathEnum {
  String get rawValue {
    switch (this) {
      case LottiePathEnum.MOON:
        return _pathValue('moon');
      case LottiePathEnum.SUN:
        return _pathValue('sun');
    }
  }

  Widget get toWidget {
    return Lottie.asset(rawValue);
  }

  String _pathValue(String path) => 'assets/lottie/$path.json';
}
