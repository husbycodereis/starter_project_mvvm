import 'package:flutter/material.dart';

import '../../../../view/home/game/model/game_model.dart';
import '../animation/social_card_animation.dart';
import '../cards/game_card.dart';



class GameGrid extends StatelessWidget {
  final List<GameModel> models;
  final void Function(GameModel item, int index)? onPressed;
  const GameGrid({
    Key? key,
    required this.models,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
      ),
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => OpenContainerGameWrapper(
        gameModel: models[index],
        closedBuilder: (BuildContext _, VoidCallback openContainer) => GameCard(
          game: models[index],
          onPressed: openContainer,
        ),
      ),
    );
  }
}
