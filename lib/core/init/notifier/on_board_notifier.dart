import 'package:flutter/material.dart';

import '../../constants/enums/locale_keys_enum.dart';
import '../cache/locale_manager.dart';

class OnBoardNotifier extends ChangeNotifier {
  final bool _isOnbardViewed =
      LocaleManager.instance.getBoolValue(SharedPrefKeys.IS_FIRST_LOAD);
  bool get isOnBoardViewed => _isOnbardViewed;
}
