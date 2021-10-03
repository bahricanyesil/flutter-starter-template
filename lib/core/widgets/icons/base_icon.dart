import 'package:flutter/material.dart';

import '../../extensions/context/responsiveness_extension.dart';
import '../../extensions/context/theme_extension.dart';
import '../../helpers/helpers_shelf.dart';

class BaseIcon extends StatelessWidget {
  final IconData iconData;
  final double widthFactor;
  final bool highlight;
  final Color? color;
  final EdgeInsets? padding;
  const BaseIcon(
    this.iconData, {
    required this.widthFactor,
    this.highlight = false,
    this.color,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FittedBox(
        fit: BoxFit.scaleDown,
        child: Padding(
          padding: _getPadding(context),
          child: Icon(
            iconData,
            size:
                context.width * (highlight ? (widthFactor * 1.2) : widthFactor),
            color: _iconColor(context),
          ),
        ),
      );

  EdgeInsets _getPadding(BuildContext context) =>
      padding ??
      (DeviceTypeHelper(context).isLandscape
          ? EdgeInsets.symmetric(horizontal: context.width * .8)
          : EdgeInsets.zero);

  Color? _iconColor(BuildContext context) =>
      color ?? (highlight ? context.primaryColor : null);
}
