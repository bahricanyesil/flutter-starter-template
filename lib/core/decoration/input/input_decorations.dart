import 'package:flutter/material.dart';

import '../../constants/border/border_radii.dart';
import '../../extensions/context/context_extensions_shelf.dart';
import '../../helpers/helpers_shelf.dart';
import '../../widgets/icons/base_icon.dart';

class InputDeco {
  InputDeco(this.context) {
    isLandscape = DeviceTypeHelper(context).isLandscape;
  }
  final BuildContext context;
  late final bool isLandscape;

  InputDecoration loginDeco({
    String? hintText,
    IconData? prefixIcon,
    Color? backgroundColor,
    double paddingFactor = .5,
  }) =>
      InputDecoration(
        contentPadding: EdgeInsets.all(context.width * paddingFactor),
        hintText: hintText,
        hintStyle: _hintTextStyle,
        enabledBorder: _getOutlineBorder(.5, 1),
        focusedBorder: _getOutlineBorder(1.1, 1),
        prefixIcon: getPrefixIcon(prefixIcon),
      );

  Widget? getPrefixIcon(IconData? prefixIcon) => prefixIcon == null
      ? null
      : BaseIcon(prefixIcon, widthFactor: isLandscape ? 2.3 : 3);

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

  TextStyle get _hintTextStyle =>
      (isLandscape ? context.headline4 : context.bodyText2)
          .copyWith(color: context.primaryDarkColor);
}
