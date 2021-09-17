import 'package:flutter/material.dart';

import '../../extensions/context/responsiveness_extension.dart';
import '../../extensions/context/theme_extension.dart';

class BaseIcon extends StatelessWidget {
  final IconData iconData;
  final double widthFactor;
  final bool highlight;
  final Color? color;
  const BaseIcon(
    this.iconData, {
    required this.widthFactor,
    this.highlight = false,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FittedBox(
        child: Icon(
          iconData,
          size: context.width * (highlight ? (widthFactor * 1.2) : widthFactor),
          color: color ?? (highlight ? context.primaryLightColor : null),
        ),
      );
}
