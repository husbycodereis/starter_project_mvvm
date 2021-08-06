import 'package:flutter/material.dart';
import 'package:starter_project/core/constants/enums/project_platform_enum.dart';
import 'package:starter_project/core/constants/navigation/navigation_constants.dart';
import 'package:starter_project/core/init/notifier/on_board_notifier.dart';
import 'package:mobx/mobx.dart';

import 'package:starter_project/core/base/model/base_view_model.dart';
import 'package:starter_project/view/authentication/splash/service/ISplashService.dart';
import 'package:provider/provider.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  late ISplashService splashService;
  late OnBoardAndLoginNotifier onBoardAndLoginNotifier;

  _SplashViewModelBase(this.splashService);

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    startAnimationOnView();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      controlAppState();
    });
    onBoardAndLoginNotifier = context!.watch<OnBoardAndLoginNotifier>();
  }

  @observable
  bool isFirstInit = true;

  Future<void> controlAppState() async {
    final isNeedForceUpdate = _checkApversion();
    if (isNeedForceUpdate) {
      showAboutDialog(context: context!, children: [const Text('please update the application')]);
    } else {
      await navigateToScreens();
    }
  }

  bool _checkApversion() {
    final response =
        splashService.checkDeviceVersionMock(version: '1.0.0', platform: '${PlatformProject.IOS.versionNumber}');
    return response.isForceUpdate!;
  }

  Future<void> startAnimationOnView() async {
    if (context == null) return;
    await Future.delayed(const Duration(milliseconds: 500));
    _changeFirstInit();
  }

  Future<void> navigateToScreens() async {
    // await Future.delayed(const Duration(milliseconds: 1200));
    await navigation.navigateToPageClear(
      path: onBoardAndLoginNotifier.isOnBoardViewed
          ? onBoardAndLoginNotifier.isLoggedIn
              ? NavigationConstants.HOME
              : NavigationConstants.LOGIN_VIEW
          : NavigationConstants.ON_BOARD,
    );
  }

  @action
  void _changeFirstInit() {
    isFirstInit = !isFirstInit;
  }
}
