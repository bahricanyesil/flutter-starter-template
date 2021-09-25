import 'package:flutter/material.dart';
import '../../constants/border/border_radii.dart';

import '../../extensions/context/context_extensions_shelf.dart';

class TextFormDeco {
  const TextFormDeco(this.context);
  final BuildContext context;

  InputDecoration loginDeco(
          {String? hintText, IconData? prefixIcon, Color? backgroundColor}) =>
      InputDecoration(
        contentPadding: EdgeInsets.all(context.width * 2),
        hintText: hintText,
        hintStyle: context.headline5.copyWith(color: context.primaryDarkColor),
        enabledBorder: _getOutlineBorder(.5, 1),
        focusedBorder: _getOutlineBorder(1.1, 1),
        prefixIcon: getPrefixIcon(prefixIcon),
      );

  Widget? getPrefixIcon(IconData? prefixIcon) => prefixIcon == null
      ? null
      : FittedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 1.5),
            child: Icon(
              prefixIcon,
              color: context.primaryDarkColor,
            ),
          ),
        );

  InputDecoration dialogText(
          {required String hintText, double? verticalPadding}) =>
      InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: context.height * (verticalPadding ?? 2),
          horizontal: context.width * 1.8,
        ),
        hintText: hintText,
        hintStyle: context.headline5
            .copyWith(color: context.primaryLightColor.withOpacity(.8)),
        enabledBorder: _getOutlineBorder(.5, .8),
        focusedBorder: _getOutlineBorder(1.1, 1),
      );

  OutlineInputBorder _getOutlineBorder(double width, double opacity) =>
      OutlineInputBorder(
        borderRadius: BorderRadii.mediumCircular,
        borderSide: BorderSide(
          width: width,
          color: context.primaryLightColor.withOpacity(opacity),
        ),
      );
}
