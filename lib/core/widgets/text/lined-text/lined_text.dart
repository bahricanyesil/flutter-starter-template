import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../extensions/context/responsiveness_extensions.dart';
import '../../../extensions/context/theme_extensions.dart';
import '../base_text.dart';

/// A text with a line before or after.
class LinedText extends StatelessWidget {
  /// Default constructor of [LinedText].
  const LinedText({
    required this.text,
    this.textStyle,
    this.lineColor,
    this.lineThickness,
    this.textLineAlignment = TextLineAlignment.before,
    Key? key,
  }) : super(key: key);

  /// Text will be displayed.
  final String text;

  /// Custom text style for the text.
  final TextStyle? textStyle;

  /// Color of the line(s).
  final Color? lineColor;

  /// Thickness of the line(s).
  final double? lineThickness;

  /// Alignment of the lines according to the text.
  final TextLineAlignment textLineAlignment;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          _line(context),
          SizedBox(width: context.width * 2),
          Expanded(flex: 2, child: _baseText),
          SizedBox(width: context.width * 2),
          if (textLineAlignment == TextLineAlignment.around) _line(context),
        ],
      );

  Widget get _baseText => BaseText(text,
      flatText: true, color: lineColor, fontWeight: FontWeight.w600);

  Widget _line(BuildContext context) => Expanded(
        flex: textLineAlignment == TextLineAlignment.around ? 3 : 6,
        child: Container(
          decoration: BoxDecoration(color: lineColor ?? context.primaryColor),
          height: lineThickness ?? context.height * .4,
        ),
      );
}

/// Alignment of the line in the [LinedText].
enum TextLineAlignment {
  /// Line is aligned before the text.
  before,

  /// Line is aligned after the text.
  after,

  /// Line is aligned around the text.
  around,
}
