import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:starter_project/core/base/view/base_view.dart';
import 'package:starter_project/core/constants/image/image_constants.dart';
import 'package:starter_project/core/extensions/context_extensions.dart';
import 'package:starter_project/core/extensions/string_extensions.dart';
import 'package:starter_project/core/init/lang/locale_keys.g.dart';
import 'package:starter_project/core/init/network/vexana_manager.dart';
import 'package:starter_project/view/authentication/splash/service/ISplashService.dart';
import 'package:starter_project/view/authentication/splash/viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(SplashService(VexanaManager.instance!.networkManager)),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel viewModel) => Scaffold(
        backgroundColor: context.customColors.orange,
        body: SafeArea(
            child: Stack(
          children: [
            buildAnimatedTextAndCircularProgressBar(context, viewModel),
            buildAnimatedIcon(context, viewModel),
          ],
        )),
      ),
    );
  }

  Center buildAnimatedTextAndCircularProgressBar(BuildContext context, SplashViewModel viewModel) {
    return Center(
      child: Observer(builder: (_) {
        return AnimatedOpacity(
          duration: context.normalDuration,
          opacity: viewModel.isFirstInit ? 0 : 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                LocaleKeys.setting_splash_welcome.locale,
                style: context.textTheme.headline2!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                textAlign: TextAlign.center,
              ),
              context.sizedBoxLowVertical,
              CircularProgressIndicator.adaptive(
                backgroundColor: context.customColors.red,
              )
            ],
          ),
        );
      }),
    );
  }

  Widget buildAnimatedIcon(BuildContext context, SplashViewModel viewModel) {
    return Observer(builder: (_) {
      return AnimatedAlign(
        duration: context.shortDuration,
        alignment: viewModel.isFirstInit ? Alignment.center : Alignment.bottomCenter,
        child: Image.asset(
          ImageConstants.instance.projectIcon,
          width: context.dynamicWidth(0.3),
        ),
      );
    });
  }
}
