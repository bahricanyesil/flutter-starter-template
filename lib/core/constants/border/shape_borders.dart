import 'package:flutter/material.dart';
import 'border_radii.dart';

class ShapedBorders {
  static const RoundedRectangleBorder roundedLow =
      RoundedRectangleBorder(borderRadius: BorderRadii.lowCircular);
  static const RoundedRectangleBorder roundedLowMed =
      RoundedRectangleBorder(borderRadius: BorderRadii.lowMedCircular);
  static const RoundedRectangleBorder roundedMedium =
      RoundedRectangleBorder(borderRadius: BorderRadii.mediumCircular);
  static const RoundedRectangleBorder roundedMedHigh =
      RoundedRectangleBorder(borderRadius: BorderRadii.medHighCircular);
  static const RoundedRectangleBorder roundedHigh =
      RoundedRectangleBorder(borderRadius: BorderRadii.highCircular);
  static const RoundedRectangleBorder roundedExtreme =
      RoundedRectangleBorder(borderRadius: BorderRadii.extremeCircular);
}
