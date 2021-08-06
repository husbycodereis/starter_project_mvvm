import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/image/image_path_svg.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../view_model/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        viewModel: LoginViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, LoginViewModel viewModel) =>
            DefaultTabController(length: 2, child: buildBody(context, viewModel)));
  }

  Scaffold buildBody(BuildContext context, LoginViewModel viewModel) => Scaffold(
        key: viewModel.scaffoldState,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildAnimatedContainer(context),
              buildTabBar(context),
              Expanded(
                  flex: 6,
                  child: Padding(
                    padding: context.paddingNormalAll,
                    child: buildForm(viewModel, context),
                  ))
            ],
          ),
        ),
      );

  AnimatedContainer buildAnimatedContainer(BuildContext context) {
    return AnimatedContainer(
        color: context.customColors.white,
        duration: context.shortDuration,
        height: context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
        child: Center(child: SvgPicture.asset(SVGImagePaths.instance!.loginGirlSVG)));
  }

  Container buildTabBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.customColors.white, borderRadius: const BorderRadius.vertical(bottom: Radius.circular(50))),
      child: Padding(
        padding: EdgeInsets.only(left: context.highValue, right: context.highValue, bottom: context.lowValue),
        child: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: context.colors.secondary,
            indicatorWeight: 3,
            labelStyle: context.textTheme.bodyText1,
            labelColor: context.customColors.black,
            tabs: [Tab(icon: Text(LocaleKeys.login_tabOne.locale)), Tab(icon: Text(LocaleKeys.login_tabTwo.locale))]),
      ),
    );
  }

  Form buildForm(LoginViewModel viewModel, BuildContext context) {
    return Form(
      key: viewModel.formState,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(
            flex: 6,
          ),
          buildTextFormFieldEmail(context, viewModel),
          buildTextFormFieldPassword(context, viewModel),
          const Spacer(),
          buildForgotPassword(),
          const Spacer(
            flex: 6,
          ),
          buildLoginButton(context, viewModel),
          const Spacer(),
          buildSignUpText(),
          const Spacer()
        ],
      ),
    );
  }

  TextFormField buildTextFormFieldEmail(BuildContext context, LoginViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      validator: (value) => value!.isValidEmail,
      decoration: InputDecoration(
          labelText: '${LocaleKeys.login_email.locale} (eve.holt@reqres.in)',
          icon: buildContainerIconField(context, Icons.email)),
    );
  }

  Widget buildTextFormFieldPassword(BuildContext context, LoginViewModel viewModel) => Observer(builder: (_) {
        return TextFormField(
          controller: viewModel.passwordController,
          validator: (value) => value!.isNotEmpty ? null : LocaleKeys.login_passwordEnter.locale,
          obscureText: viewModel.isLockOpen,
          decoration: InputDecoration(
              suffix: GestureDetector(
                onTap: () => viewModel.isLockStateChange(),
                child: Icon(viewModel.isLockOpen ? Icons.remove_red_eye_outlined : Icons.remove_red_eye),
              ),
              labelText: '${LocaleKeys.login_password.locale} (cityslicka)',
              icon: buildContainerIconField(context, Icons.lock)),
        );
      });

  Container buildContainerIconField(BuildContext context, IconData icon) {
    return Container(
        padding: context.paddingLowAll,
        color: context.colors.secondary,
        child: Icon(
          icon,
          color: context.customColors.white,
        ));
  }

  Widget buildForgotPassword() => Align(alignment: Alignment.centerRight, child: Text(LocaleKeys.login_forgot.locale));

  Widget buildLoginButton(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return ElevatedButton(
        onPressed: viewModel.isLoading
            ? null
            : () {
                viewModel.fetchLoginService();
              },
        style: ElevatedButton.styleFrom(
          primary: context.colors.secondary,
          shape: const StadiumBorder(),
          padding: context.paddingMediumAll,
        ),
        child: Text(
          LocaleKeys.login_enter.tr(),
          style: context.textTheme.bodyText1,
        ),
      );
    });
  }

  Widget buildSignUpText() {
    return Center(
      child: Wrap(
        children: [Text(LocaleKeys.login_sign.tr()), GestureDetector(child: Text(LocaleKeys.login_tabTwo.tr()))],
      ),
    );
  }
}
