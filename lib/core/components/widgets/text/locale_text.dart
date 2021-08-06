import 'package:flutter/material.dart';
import '../../../extensions/string_extensions.dart';

class LocaleText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  const LocaleText(
    this.text, {
    Key? key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Text(
      text.locale,
      style: style,
      textAlign: textAlign,
    );
  }
}
