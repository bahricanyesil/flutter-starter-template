import 'package:flutter/material.dart';

import '../../decoration/boxes/box_decorations.dart';
import '../../extensions/context/responsiveness_extension.dart';

class CircleWidget extends StatelessWidget {
  final Widget child;
  final double widthFactor;
  final Function()? onTap;
  final double? borderWidthFactor;
  const CircleWidget({
    required this.child,
    this.widthFactor = 4.5,
    this.borderWidthFactor,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(context.width * widthFactor / 4.4),
          alignment: Alignment.center,
          decoration: BoxDecorations(context)
              .circleDeco(borderWidthFactor: borderWidthFactor),
          width: context.width * widthFactor,
          child: child,
        ),
      );
}
