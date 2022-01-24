import 'package:flutter/material.dart';

/// Various constant [BorderRadius] values to use across the app.
class BorderRadii {
  /// Low circular border.
  static const BorderRadius lowCircular = BorderRadius.all(Radius.circular(10));

  /// Low-Medium circular border.
  static const BorderRadius lowMedCircular =
      BorderRadius.all(Radius.circular(18));

  /// Medium circular border.
  static const BorderRadius mediumCircular =
      BorderRadius.all(Radius.circular(25));

  /// Medium-High circular border.
  static const BorderRadius medHighCircular =
      BorderRadius.all(Radius.circular(50));

  /// High circular border.
  static const BorderRadius highCircular =
      BorderRadius.all(Radius.circular(75));

  /// Extreme circular border.
  static const BorderRadius extremeCircular =
      BorderRadius.all(Radius.circular(100));
}
