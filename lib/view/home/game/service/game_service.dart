import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/components/utility/service_helper.dart';
import '../../../../core/constants/enums/network_route_enum.dart';
import '../model/game_model.dart';
import 'IGameService.dart';

class GameService extends IGameService with ServiceHelper {
  GameService(INetworkManager networkManager) : super(manager: networkManager);

  @override
  Future<List<GameModel>> fetchGames(BuildContext context) async {
    final response = await manager.send<GameModel, List<GameModel>>(NetWorkRoutes.PHOTOS.rawValue,
        parseModel: GameModel(), method: RequestType.GET);
    showMessage(response.error, context);
    return response.data ?? [];
  }

  @override
  Future<GameModel?> fetchSelectedGame(dynamic id, BuildContext context) async {
    final response = await manager.send<GameModel, GameModel>(NetWorkRoutes.PHOTOS.rawValue,
        parseModel: GameModel(), urlSuffix: '/$id', method: RequestType.GET);
    showMessage(response.error, context);
    return response.data;
  }
}
