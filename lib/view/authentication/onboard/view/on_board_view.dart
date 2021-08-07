import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/widgets/avatar/on_board_circle.dart';
import '../../../../core/components/widgets/text/locale_text.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../model/on_board_model.dart';
import '../view_model/on_board_view_model.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) => Scaffold(
        body: Padding(
          padding: context.paddingNormalHorizontal,
          child: Column(
            children: [
              const Spacer(),
              Expanded(
                flex: 5,
                child: buildPageView(viewModel),
              ),
              Expanded(flex: 2, child: buildRowFooter(viewModel, context)),
            ],
          ),
        ),
      ),
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
        itemCount: viewModel.onBoardItems.length,
        onPageChanged: (value) => viewModel.changeCurrentIndex(value),
        itemBuilder: (context, index) {
          return buildMainContenColumnBody(context, viewModel.onBoardItems[index]);
        });
  }

  Row buildRowFooter(OnBoardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildDotIndicator(viewModel),
        Expanded(child: Center(child: Observer(builder: (_) {
          return Visibility(visible: viewModel.isLoading, child: const CircularProgressIndicator());
        }))),
        buildFloatingActionButton(context, viewModel)
      ],
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context, OnBoardViewModel viewModel) {
    return FloatingActionButton(
        onPressed: () {
          viewModel.completeOnBoard();
        },
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: context.height * 0.025,
        ));
  }

  ListView buildDotIndicator(OnBoardViewModel viewModel) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.onBoardItems.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Observer(
            builder: (_) {
              return OnBoardCircle(isSelected: viewModel.currentPageIndex == index);
            },
          );
        });
  }

  Column buildMainContenColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 5, child: buildSvgPicture(model.imagePath!)),
        buildDescriptionColumn(context, model),
      ],
    );
  }

  Column buildDescriptionColumn(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        LocaleText(
          model.title!,
          style: context.textTheme.headline1,
        ),
        Padding(
          padding: context.paddingMediumHorizontal,
          child: LocaleText(
            model.description!,
            textAlign: TextAlign.center,
            style: context.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  SvgPicture buildSvgPicture(String path) => SvgPicture.asset(path);
}
