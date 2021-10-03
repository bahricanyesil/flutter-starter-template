import 'package:flutter/material.dart';

import '../../extensions/context/edge-insets/symmetric_edge_insets_extensions.dart';
import '../../helpers/device-type/device_type_helper.dart';
import '../icons/base_icon.dart';

class BaseIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  final double? size;
  const BaseIconButton({
    required this.icon,
    required this.onPressed,
    this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FittedBox(
        child: Padding(
          padding: DeviceTypeHelper(context).isLandscape
              ? context.horizontalExtremeLow
              : context.horizontalLow,
          child: _iconButton,
        ),
      );

  Widget get _iconButton => IconButton(
        splashRadius: 20,
        iconSize: size ?? 24,
        icon: BaseIcon(icon, widthFactor: 3),
        onPressed: onPressed,
      );
}
