import 'package:flutter/material.dart';
import '../../extensions/context/class_helpers.dart';

class NotFittedText extends StatelessWidget {
  final String textKey;
  final TextStyle? style;
  final TextAlign textAlign;
  final int maxLines;
  const NotFittedText(
    this.textKey, {
    this.style,
    this.textAlign = TextAlign.center,
    this.maxLines = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        context.tr(textKey),
        style: style,
        textAlign: textAlign,
        overflow: TextOverflow.clip,
        maxLines: maxLines,
      );
}
