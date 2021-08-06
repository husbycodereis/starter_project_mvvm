part of 'game_view.dart';

Widget buildNewCardGridView(BuildContext context, GameViewModel viewModel) {
  return viewModel.fetchAllGames().toBuild<List<GameModel>?>(
      onSuccess: (data) {
        return Padding(
          padding: context.paddingLowAll,
          child: Column(
            children: [
              HeaderButton(
                title: LocaleKeys.game_newUpdate,
                onPressed: () {},
              ),
              Observer(builder: (_) {
                return GameGrid(
                  models: data!,
                );
              })
            ],
          ),
        );
      },
      loadingWidget: SizedBox(
        height: context.dynamicHeight(0.3),
        child: Shimmer.fromColors(
          baseColor: context.customColors.darkGrey,
          highlightColor: context.customColors.orange,
          child: const Text('Games loading'),
        ),
      ),
      notFoundWidget: const Text('no items found '),
      onError: const Text('error fetching data '));
}

Padding buildTopDownloadsGridView(BuildContext context) {
  return Padding(
    padding: context.paddingLowAll,
    child: Column(
      children: [
        HeaderButton(
          title: LocaleKeys.game_topDownload,
          onPressed: () {},
        ),
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.8),
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (contex, index) => GameCard(
                game: GameModel(id: 10, title: 'Title', url: 'https://picsum.photos/200/300'), onPressed: () {}))
      ],
    ),
  );
}
