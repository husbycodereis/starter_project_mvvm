import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../../../../view/home/game/model/game_model.dart';
import '../../../../view/home/game/view/game_view_details.dart';
import '../../../../view/home/social/model/social_user_model.dart';
import '../../../../view/home/social/view/social_view_detail.dart';


class OpenContainerSocialWrapper extends StatelessWidget {
  ContainerTransitionType get _transitionType => ContainerTransitionType.fade;

  final OpenContainerBuilder? closedBuilder;
  final ClosedCallback<bool?>? onClosed;
  final SocialUser? socialUser;
  const OpenContainerSocialWrapper({
    Key? key,
    this.closedBuilder,
    this.onClosed,
    this.socialUser,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: _transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return SocialUserViewDetail(socialUser: socialUser!);
      },
      onClosed: onClosed,
      tappable: false,
      closedBuilder: closedBuilder! as Widget Function(BuildContext, void Function()),
    );
  }
}

class OpenContainerGameWrapper extends StatelessWidget {
  ContainerTransitionType get _transitionType => ContainerTransitionType.fade;

  final OpenContainerBuilder? closedBuilder;
  final ClosedCallback<bool?>? onClosed;
  final GameModel? gameModel;
  const OpenContainerGameWrapper({
    Key? key,
    this.closedBuilder,
    this.onClosed,
    this.gameModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: _transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return GameViewDetails(gameModel: gameModel!);
      },
      onClosed: onClosed,
      tappable: false,
      closedBuilder: closedBuilder! as Widget Function(BuildContext, void Function()),
    );
  }
}

