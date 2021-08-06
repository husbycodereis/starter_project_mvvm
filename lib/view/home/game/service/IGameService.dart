import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/game_model.dart';

abstract class IGameService {
  final INetworkManager manager;

  IGameService({
    required this.manager,
  });

  Future<List<GameModel>> fetchGames(BuildContext context);
  Future<GameModel?> fetchSelectedGame(dynamic id, BuildContext context);
}
