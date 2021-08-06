import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/widgets/button/header_button.dart';
import '../../../../core/components/widgets/cards/game_card.dart';
import '../../../../core/components/widgets/grid/game_grid_view.dart';
import '../../../../core/components/widgets/slider/image_slider.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/future_extension.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/network/vexana_manager.dart';
import '../model/game_model.dart';
import '../model/game_view_state.dart';
import '../service/game_service.dart';
import '../viewmodel/game_view_model.dart';

part 'game_view_cards.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<GameViewModel>(
      viewModel: GameViewModel(GameService(VexanaManager.instance!.networkManager)),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, GameViewModel viewModel) => Scaffold(
          appBar: buildAppBar(context),
          body: Observer(builder: (_) {
            return viewModel.isLoading
                ? const CircularProgressIndicator()
                : DefaultTabController(
                    length: 5,
                    child: ListView.builder(
                      itemCount: GameViewItems.values.length,
                      itemBuilder: (BuildContext context, int index) {
                        switch (GameViewItems.values[index]) {
                          case GameViewItems.SEARCH_BAR:
                            return buildPaddingSearchBar(context);
                          case GameViewItems.TAB_BAR:
                            return buildTabBar(viewModel);
                          case GameViewItems.SLIDER:
                            return const ImageSlider();
                          case GameViewItems.NEW_UPDATED_GAMES_CARD:
                            return buildNewCardGridView(context, viewModel);
                          case GameViewItems.TOP_UPDATED_GAMES_CARD:
                            return buildTopDownloadsGridView(context);
                          default:
                            throw Exception('STATE NOT FOUND');
                        }
                      },
                    ),
                  );
          })),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.rounded_corner),
      centerTitle: true,
      title: Text(
        LocaleKeys.game_title.locale,
        style: context.textTheme.headline5!.copyWith(color: context.customColors.orange),
      ),
      actions: [
        Padding(
          padding: context.paddingLowHorizontal,
          child: const Icon(Icons.camera),
        )
      ],
    );
  }

  TabBar buildTabBar(GameViewModel viewModel) {
    return TabBar(isScrollable: true, tabs: viewModel.gameTabItems.map((e) => Tab(text: e.locale)).toList());
  }

  Padding buildPaddingSearchBar(BuildContext context) {
    return Padding(
      padding: context.paddingLowAll,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: context.customColors.darkGrey,
                width: 0.8,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: context.customColors.darkGrey,
                width: 0.8,
              )),
        ),
      ),
    );
  }

 
} 
