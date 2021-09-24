import 'package:flutter/material.dart';

import '../../extensions/context/theme_extension.dart';
import '../../providers/lang/app_localizations.dart';

class BaseText extends StatelessWidget {
  final String textKey;
  final TextStyle? textStyle;
  final bool highlight;
  final TextAlign textAlign;
  final Color? color;
  final TextDecoration? decoration;
  const BaseText(
    this.textKey, {
    this.textStyle,
    this.highlight = false,
    this.textAlign = TextAlign.center,
    this.color,
    this.decoration,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FittedBox(
        child: Text(
          AppLocalizations.of(context)!.translate(textKey),
          style: textStyle ?? context.headline5,
          textAlign: textAlign,
        ),
      );
}
