import 'package:flutter/material.dart';
import '../../extensions/context/edge-insets/symmetric_edge_insets_extensions.dart';

class BaseIconButton extends StatelessWidget {
  final bool isVisible;
  final IconData icon;
  final Function() onPressed;
  const BaseIconButton({
    required this.icon,
    required this.onPressed,
    this.isVisible = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Visibility(
        visible: isVisible,
        child: FittedBox(
          child: Padding(
            padding: context.horizontalLow,
            child: _getIconButton(),
          ),
        ),
      );

  Widget _getIconButton() => IconButton(
        splashRadius: 20,
        icon: Icon(icon),
        onPressed: onPressed,
      );
}
