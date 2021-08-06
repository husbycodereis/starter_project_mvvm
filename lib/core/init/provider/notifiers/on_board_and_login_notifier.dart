import 'package:flutter/material.dart';

import '../../../constants/enums/locale_keys_enum.dart';
import '../../cache/locale_manager.dart';

class OnBoardAndLoginNotifier extends ChangeNotifier {
  final bool _isOnbardViewed = LocaleManager.instance.getBoolValue(SharedPrefKeys.IS_FIRST_LOAD);
  final String _isLoggedIn = LocaleManager.instance.getStringValue(SharedPrefKeys.TOKEN);
  bool get isOnBoardViewed => _isOnbardViewed;
  bool get isLoggedIn => _isLoggedIn.isNotEmpty;
}
