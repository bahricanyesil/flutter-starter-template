import 'package:flutter/material.dart';
import '../../extensions/context/class_helpers.dart';

import '../../extensions/context/theme_extension.dart';

class BaseText extends StatelessWidget {
  final String textKey;
  final TextStyle? style;
  final TextAlign textAlign;
  final Color? color;
  const BaseText(
    this.textKey, {
    this.style,
    this.textAlign = TextAlign.center,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          context.tr(textKey),
          style: _defaultStyle(context),
          textAlign: textAlign,
          overflow: TextOverflow.clip,
        ),
      );

  TextStyle _defaultStyle(BuildContext context) =>
      style ?? context.headline5.copyWith(color: color);
}
