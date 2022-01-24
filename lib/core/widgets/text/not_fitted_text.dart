import 'package:flutter/material.dart';

import '../../decoration/text_styles.dart';
import '../../extensions/context/language_helpers.dart';
import '../../extensions/string/string_util_extensions.dart';
import '../../extensions/text-style/decoration_extensions.dart';
import '../../providers/providers_shelf.dart';

/// Base text with custom parameters but not wrapped with [FittedBox].
class NotFittedText extends StatelessWidget {
  /// This is the difference from the "BaseText", it also allows multline texts.
  /// Implements some further customizations.
  const NotFittedText(
    this.text, {
    this.style,
    this.textAlign = TextAlign.center,
    this.maxLines = 1,
    Key? key,
  }) : super(key: key);

  /// Text content.
  final String text;

  /// Custom style for the text.
  final TextStyle? style;

  /// Alignment of the task.
  final TextAlign textAlign;

  /// Maximum liens for the text.
  final int? maxLines;

  @override
  Widget build(BuildContext context) => Text(
        context.tr(text).useCorrectEllipsis,
        style: context.watch<ThemeProvider>().isDark
            ? _defaultStyle(context)
            : _defaultStyle(context).dark(),
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
      );

  TextStyle _defaultStyle(BuildContext context) =>
      TextStyles(context).subBodyStyle().merge(style);
}
