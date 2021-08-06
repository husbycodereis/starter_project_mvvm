import 'package:flutter/material.dart';

import '../../extensions/context_extensions.dart';

class IndicatorListView extends StatefulWidget {
  final int itemCount;
  final int currentIndex;
  final Widget Function(int index)? onListItem;
  const IndicatorListView({
    Key? key,
    required this.itemCount,
    required this.currentIndex,
    this.onListItem,
  }) : super(key: key);

  @override
  _IndicatorListViewState createState() => _IndicatorListViewState();
}

class _IndicatorListViewState extends State<IndicatorListView> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.itemCount,
        itemBuilder: (context, index) => buildPadding(context, index));
  }

  Padding buildPadding(BuildContext context, int index) {
    return Padding(
        padding: context.paddingLowAll, child: buildCircleAvatar(index, context));
  }

  CircleAvatar buildCircleAvatar(int index, BuildContext context) {
    return CircleAvatar(
      backgroundColor: isCurrentIndex(index) ? Colors.blue : Colors.grey,
      radius:
          isCurrentIndex(index) ? context.width * 0.02 : context.width * 0.01,
      child: AnimatedOpacity(
        opacity: opacityValue(index),
        duration: context.shortDuration,
        child: widget.onListItem!(index),
      ),
    );
  }

  double opacityValue(int index) => isCurrentIndex(index) ? 1 : 0;

  bool isCurrentIndex(int index) => widget.currentIndex == index;
}
