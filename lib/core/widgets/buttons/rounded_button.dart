import 'package:flutter/material.dart';

import '../../decoration/buttons/button_styles.dart';
import '../../extensions/extensions_shelf.dart';
import '../texts/base_text.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.buttonText,
    required this.action,
    this.backgroundColor,
    this.borderColor,
    this.iconPath = '',
    this.borderRadius,
    this.borderWidth = 2.0,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  final String buttonText;
  final Function() action;
  final Color? backgroundColor;
  final Color? borderColor;
  final String iconPath;
  final BorderRadius? borderRadius;
  final double borderWidth;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyles(context).roundedStyle(
          borderWidth: borderWidth,
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          borderRadius: borderRadius,
        ),
        onPressed: action,
        child: getRow(context),
      );

  Widget getRow(BuildContext context) => Row(
        children: <Widget>[
          if (iconPath == '')
            Expanded(child: Container())
          else
            preImage(context),
          BaseText(buttonText, textStyle: textStyle ?? context.headline4),
          Expanded(child: Container()),
        ],
      );

  Widget preImage(BuildContext context) => Expanded(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: context.lowMedEdgeInsets,
            child: iconPath.pngLogo,
          ),
        ),
      );
}
