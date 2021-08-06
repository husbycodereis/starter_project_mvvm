import 'package:flutter/material.dart';
import 'package:starter_project/view/authentication/splash/view/splash_view.dart';

import '../../../view/authentication/login/view/login_view.dart';
import '../../../view/authentication/onboard/view/on_board_view.dart';
import '../../../view/home/home_view.dart';
import '../../../view/settings/model/settings_dynamic_model.dart';
import '../../../view/settings/view/subview/settings_dynamic_view.dart';
import '../../components/exceptions/navigate_model_exception.dart';
import '../../components/widgets/cards/not_found_navigation.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView());
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(const LoginView());
      case NavigationConstants.HOME:
        return normalNavigate(const HomeView());
      case NavigationConstants.ON_BOARD:
        return normalNavigate(const OnBoardView());
      case NavigationConstants.SETTINGS_WEB_VIEW:
        if (args.arguments is SettingsDynamicModel) {
          return normalNavigate(SettingsDynamicView(model: args.arguments! as SettingsDynamicModel));
        }
        throw NavigateException<SettingsDynamicModel>(args.arguments);

      default:
        return normalNavigate(const NotFoundNavigation());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
