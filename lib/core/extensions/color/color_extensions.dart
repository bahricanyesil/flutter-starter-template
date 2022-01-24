import 'package:flutter/material.dart';

/// Extensions for [Color] class
extension ColorExtensions on Color {
  /// Makes color more darker.
  Color darken([double amount = .2]) => _lightened(-amount);

  /// Makes color more lighter.
  Color lighten([double amount = .2]) => _lightened(amount);

  Color _lightened(double amount) {
    assert(amount >= -1 && amount <= 1, 'Amount should be between -1 and 1');
    final HSLColor hsl = HSLColor.fromColor(this);
    final HSLColor hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }
}
