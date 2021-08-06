import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../model/game_model.dart';
import '../service/IGameService.dart';

part 'game_view_model.g.dart';

class GameViewModel = _GameViewModelBase with _$GameViewModel;

abstract class _GameViewModelBase with Store, BaseViewModel {
  final IGameService gameService;
  _GameViewModelBase(
    this.gameService,
  );
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  final List<String> gameTabItems = [
    LocaleKeys.game_tabbar_tab1,
    LocaleKeys.game_tabbar_tab2,
    LocaleKeys.game_tabbar_tab3,
    LocaleKeys.game_tabbar_tab4,
    LocaleKeys.game_tabbar_tab5,
  ];

  @observable
  bool isLoading = false;

  @observable
  List<GameModel> gamesList = [];

  @action
  Future<List<GameModel>?> fetchAllGames() async {
    final response = await gameService.fetchGames(context!);
    return gamesList = response;
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }
}
