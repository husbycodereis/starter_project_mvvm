import 'package:flutter/material.dart';

import 'normal_button.dart';

class NormalIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const NormalIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: onPressed,
      child: Center(
        child: Icon(icon),
      ),
    );
  }
}
