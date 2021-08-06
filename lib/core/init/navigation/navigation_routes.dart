import 'package:flutter/material.dart';
import 'package:starter_project/view/authentication/onboard/view/on_board_view.dart';
import 'package:starter_project/view/home/social/view/social_view.dart';

import '../../../view/authentication/login/view/login_view.dart';
import '../../components/cards/not_found_navigation.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(const LoginView());
      case NavigationConstants.ON_BOARD:
        return normalNavigate(const OnBoardView());
      case NavigationConstants.SOCIAL_VIEW:
        return normalNavigate(const SocialView());

      default:
        return normalNavigate(const NotFoundNavigation());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
