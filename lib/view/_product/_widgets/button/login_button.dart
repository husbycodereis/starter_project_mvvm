import 'package:flutter/material.dart';

import '../../../../core/components/buttons/icon_button.dart';

class LoginButton extends StatelessWidget {
  final Function(String data) onComplete;
  const LoginButton({
    Key? key,
    required this.onComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NormalIconButton(
      icon: Icons.login,
      onPressed: () {
        onComplete('OK');
      },
    );
  }
}
