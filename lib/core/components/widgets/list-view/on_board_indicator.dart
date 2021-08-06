import 'package:flutter/material.dart';

import 'indicator_list_view.dart';

class OnBoardIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  const OnBoardIndicator({
    Key? key,
    required this.itemCount,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IndicatorListView(
      itemCount: itemCount,
      currentIndex: currentIndex,
      onListItem: (index) {
        return Text(index.toString());
      },
    );
  }
}
