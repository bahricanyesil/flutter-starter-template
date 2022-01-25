import 'package:flutter/material.dart';
import '../../extensions/color/color_extensions.dart';

import '../../extensions/context/responsiveness_extensions.dart';
import '../../extensions/context/theme_extensions.dart';
import '../icons/base_icon.dart';

/// Customized [IconButton].
class DefaultIconButton extends StatelessWidget {
  /// Default constructor for [DefaultIconButton].
  const DefaultIconButton({
    required this.onPressed,
    required this.icon,
    this.color,
    Key? key,
  }) : super(key: key);

  /// Callback to call when on pressed to the button.
  final VoidCallback onPressed;

  /// Icon to represent in the button.
  final IconData icon;

  /// Custom color for the icon.
  final Color? color;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        clipBehavior: Clip.hardEdge,
        child: IconButton(
          icon: BaseIcon(icon, color: color),
          splashRadius: context.responsiveSize * 7,
          padding: EdgeInsets.zero,
          highlightColor: context.primaryLightColor,
          constraints: const BoxConstraints(),
          iconSize: context.responsiveSize * 8,
          onPressed: onPressed,
          hoverColor: context.primaryColor.lighten(.05),
        ),
      );
}
