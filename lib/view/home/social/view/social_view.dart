import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:starter_project/core/extensions/context_extensions.dart';
import 'package:starter_project/core/extensions/string_extensions.dart';
import 'package:starter_project/core/init/lang/locale_keys.g.dart';
import 'package:starter_project/core/init/network/vexana_manager.dart';
import 'package:starter_project/view/_product/_widgets/animation/social_card_animation.dart';
import 'package:starter_project/view/_product/_widgets/list-tile/friends_card.dart';
import 'package:starter_project/view/home/social/service/social_service.dart';

import '../../../../core/base/view/base_view.dart';
import '../viewmodel/social_view_model.dart';

class SocialView extends StatelessWidget {
  const SocialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SocialViewModel>(
      viewModel: SocialViewModel(SocialService(VexanaManager.instance!.networkManager)),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SocialViewModel viewModel) => Scaffold(
        appBar: buildAppBar(context, viewModel),
        body: Padding(
          padding: context.paddingLowAll * 1.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextFindFriends(context),
              const Spacer(
                flex: 2,
              ),
              TextField(
                onChanged: (value) {
                  viewModel.fetchAllSearchQuery(value);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: context.lowValue * 0.5),
                  prefixIcon: Icon(
                    Icons.search,
                    color: context.colors.onSecondary.withOpacity(0.4),
                  ),
                  filled: true,
                  fillColor: context.customColors.white,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        width: 0.8,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        width: 0.3,
                      )),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 90,
                child: Observer(builder: (_) {
                  return buildListView(viewModel);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, SocialViewModel viewModel) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 70,
      leading: TextButton(
        onPressed: () {
          viewModel.fetchAllUsers();
        },
        child: Text(
          LocaleKeys.social_cancel.locale,
          style: context.textTheme.subtitle2,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            LocaleKeys.social_next.locale,
            style: TextStyle(color: context.colors.primary),
          ),
        )
      ],
    );
  }

  Text buildTextFindFriends(BuildContext context) {
    return Text(
      LocaleKeys.social_findFriends.locale,
      style: context.textTheme.headline2!.copyWith(color: context.customColors.black, fontWeight: FontWeight.w600),
    );
  }

  ListView buildListView(SocialViewModel viewModel) {
    return ListView.separated(
      itemCount: viewModel.socialUserList.length,
      itemBuilder: (BuildContext context, int index) {
        return OpenContainerSocialWrapper(
          socialUser: viewModel.socialUserList[index],
          closedBuilder: (BuildContext _, VoidCallback openContainer) =>
              FriendsCard(user: viewModel.socialUserList[index], onPressed: openContainer),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
