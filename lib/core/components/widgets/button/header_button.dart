import 'package:flutter/material.dart';

import '../../../extensions/context_extensions.dart';
import '../../../extensions/string_extensions.dart';
import '../../../init/lang/locale_keys.g.dart';

class HeaderButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const HeaderButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [buildTitleText(context), buildElevatedButton()],
    );
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
        onPressed: onPressed,
        child: Row(
          children: [Text(LocaleKeys.game_viewAll.locale), const Icon(Icons.arrow_right)],
        ));
  }

  Text buildTitleText(BuildContext context) {
    return Text(
      title.locale,
      style: context.textTheme.headline5!.copyWith(color: context.customColors.orange),
    );
  }
}
