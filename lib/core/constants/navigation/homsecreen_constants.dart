import 'package:flutter/material.dart';
import '../../../view/home/game/view/game_view.dart';
import '../../../view/home/social/view/social_view.dart';
import '../../../view/settings/view/settings_view.dart';

enum HomeScreenConstantsEnum { GAME_VIEW, SOCIAL_VIEW, SETTINGS_VIEW }

extension HomeScreenRouteNamesExtension on HomeScreenConstantsEnum {
  Widget get rawValue {
    switch (this) {
      case HomeScreenConstantsEnum.GAME_VIEW:
        return const GameView();
      case HomeScreenConstantsEnum.SOCIAL_VIEW:
        return const SocialView();
      case HomeScreenConstantsEnum.SETTINGS_VIEW:
        return const SettingsView();
    }
  }
}
