import 'package:flutter/material.dart';
import '../../extensions/context/class_helpers.dart';

import '../../extensions/context/theme_extension.dart';

class BaseText extends StatelessWidget {
  final String textKey;
  final TextStyle? style;
  final TextAlign textAlign;
  final Color? color;
  final TextDecoration? decoration;
  const BaseText(
    this.textKey, {
    this.style,
    this.textAlign = TextAlign.center,
    this.color,
    this.decoration,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          context.tr(textKey),
          style: style ??
              context.headline5.copyWith(color: color, decoration: decoration),
          textAlign: textAlign,
        ),
      );
}
