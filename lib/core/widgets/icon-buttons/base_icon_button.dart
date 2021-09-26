import 'package:flutter/material.dart';
import '../../extensions/context/edge-insets/symmetric_edge_insets_extensions.dart';

class BaseIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  const BaseIconButton({
    required this.icon,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FittedBox(
        child: Padding(
          padding: context.horizontalLow,
          child: _getIconButton(),
        ),
      );

  Widget _getIconButton() => IconButton(
        splashRadius: 20,
        icon: Icon(icon),
        onPressed: onPressed,
      );
}
