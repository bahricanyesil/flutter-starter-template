import 'package:flutter/material.dart';
import 'border_radii.dart';

/// Various constant [ShapedBorders] values to use across the app.
class ShapedBorders {
  /// Low rounded rectangle shaped border.
  static const RoundedRectangleBorder roundedLow =
      RoundedRectangleBorder(borderRadius: BorderRadii.lowCircular);

  /// Low-Medium rounded rectangle shaped border.
  static const RoundedRectangleBorder roundedLowMed =
      RoundedRectangleBorder(borderRadius: BorderRadii.lowMedCircular);

  /// Medium rounded rectangle shaped border.
  static const RoundedRectangleBorder roundedMedium =
      RoundedRectangleBorder(borderRadius: BorderRadii.mediumCircular);

  /// Medium-High rounded rectangle shaped border.
  static const RoundedRectangleBorder roundedMedHigh =
      RoundedRectangleBorder(borderRadius: BorderRadii.medHighCircular);

  /// High rounded rectangle shaped border.
  static const RoundedRectangleBorder roundedHigh =
      RoundedRectangleBorder(borderRadius: BorderRadii.highCircular);

  /// Extremely rounded rectangle shaped border.
  static const RoundedRectangleBorder roundedExtreme =
      RoundedRectangleBorder(borderRadius: BorderRadii.extremeCircular);
}
