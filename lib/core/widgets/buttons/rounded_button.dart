import 'package:flutter/material.dart';

import '../../decoration/buttons/button_styles.dart';
import '../../extensions/extensions_shelf.dart';
import '../texts/base_text.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.iconPath = '',
    this.borderRadius,
    this.borderWidth = 1.4,
    this.textStyle,
    this.width,
    Key? key,
  }) : super(key: key);

  final String buttonText;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final String iconPath;
  final BorderRadius? borderRadius;
  final double borderWidth;
  final TextStyle? textStyle;
  final double? width;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyles(context).roundedStyle(
          borderWidth: borderWidth,
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          borderRadius: borderRadius,
          width: width,
        ),
        onPressed: onPressed,
        child: getRow(context),
      );

  Widget getRow(BuildContext context) => Padding(
        padding: context.verticalLow,
        child: Row(
          children: <Widget>[
            if (iconPath == '')
              Expanded(child: Container())
            else
              preImage(context),
            BaseText(buttonText, style: textStyle ?? context.headline4),
            Expanded(child: Container()),
          ],
        ),
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
