import 'package:flutter/material.dart';
import '../../../../view/home/game/model/game_model.dart';

class GameCard extends StatelessWidget {
  final GameModel game;
  final VoidCallback onPressed;
  const GameCard({
    Key? key,
    required this.game,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: Column(
          children: [
            Expanded(
                child: Image.network(
              game.url!,
              fit: BoxFit.cover,
            )),
            Text(game.title!.length >= 14 ? game.title!.substring(14) : game.title!),
            Text('\$ ${game.id}'),
          ],
        ),
      ),
    );
  }
}
