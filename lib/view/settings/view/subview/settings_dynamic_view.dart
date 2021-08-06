import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../model/settings_dynamic_model.dart';

class SettingsDynamicView extends StatelessWidget {
  final SettingsDynamicModel model;
  const SettingsDynamicView({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title, style: context.textTheme.headline6),
      ),
      body: WebView(
        initialUrl: model.url ?? ApplicationConstants.APP_WEB_SITE,
      ),
    );
  }
}
