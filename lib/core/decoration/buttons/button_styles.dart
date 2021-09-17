import 'package:flutter/material.dart';

import '../../constants/border/border_radii.dart';
import '../../extensions/context/theme_extension.dart';

class ButtonStyles {
  const ButtonStyles(this.context);
  final BuildContext context;

  ButtonStyle roundedStyle({
    Color? backgroundColor,
    Color? borderColor,
    BorderRadius? borderRadius,
    double? borderWidth,
    EdgeInsets? padding,
  }) =>
      ButtonStyle(
        padding: _all<EdgeInsets?>(padding),
        backgroundColor: _all<Color>(backgroundColor ?? context.canvasColor),
        shape: _all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadii.mediumCircular,
            side: BorderSide(
              color: borderColor ?? context.primaryColor,
              width: borderWidth ?? 2.0,
            ),
          ),
        ),
      );

  MaterialStateProperty<T> _all<T>(T value) => MaterialStateProperty.all(value);
}
