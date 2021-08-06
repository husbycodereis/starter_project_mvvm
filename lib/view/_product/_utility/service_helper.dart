import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../core/extensions/context_extensions.dart';

abstract class ServiceHelper {
  void showMessage(IErrorModel? errorModel, BuildContext context) {
    if (errorModel == null) {
      return;
    }
    context.showSnackBar(
        errorModel.description ?? errorModel.statusCode.toString());
  }
}
