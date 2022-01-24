import 'package:flutter/material.dart';
import '../../theme/color/l_colors.dart';

/// Text style decoration extensions.
extension TextStyleDecorations on TextStyle {
  /// Underlines the text with a custom style.
  TextStyle underline({double thickness = 2, double yOffset = -4}) {
    final Color mainColor = color ?? AppColors.white;
    return copyWith(
      shadows: <Shadow>[Shadow(color: mainColor, offset: Offset(0, yOffset))],
      color: Colors.transparent,
      decoration: TextDecoration.underline,
      decorationColor: mainColor,
      decorationThickness: thickness,
    );
  }

  /// Returns the light color version of the given text style
  TextStyle light([double opacity = .95]) =>
      copyWith(color: Colors.white.withOpacity(opacity));

  /// Returns the dark color version of the given text style
  TextStyle dark([double opacity = .85]) =>
      copyWith(color: Colors.black.withOpacity(opacity));
}
