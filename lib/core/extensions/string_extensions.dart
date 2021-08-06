import 'package:easy_localization/easy_localization.dart';

import '../constants/app/app_constants.dart';

extension StringLocalization on String {
  String get locale => this.tr();

  String? get isValidEmail =>
      contains(RegExp(ApplicationConstants.EMAIL_REGEX))
          ? null
          : 'Email is not valid';
}

extension SVGImagePathExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
}

