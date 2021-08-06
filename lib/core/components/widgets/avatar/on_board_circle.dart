import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';

class OnBoardCircle extends StatelessWidget {
  final bool isSelected;
  const OnBoardCircle({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: context.paddingLowAll,
        child: CircleAvatar(
          backgroundColor:
              context.colors.secondaryVariant.withOpacity(isSelected ? 1 : 0.2),
          radius: isSelected ? 8 : 5,
        ));
  }
}
