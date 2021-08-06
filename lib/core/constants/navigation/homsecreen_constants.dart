import 'package:flutter/material.dart';

import '../../../view/settings/view/settings_view.dart';

enum HomeScreenConstantsEnum {SETTINGS_VIEW }

extension HomeScreenRouteNamesExtension on HomeScreenConstantsEnum {
  Widget get rawValue {
    switch (this) {
      case HomeScreenConstantsEnum.SETTINGS_VIEW:
        return const SettingsView();
    }
  }
}
