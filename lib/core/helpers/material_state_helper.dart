import 'package:flutter/material.dart';

/// Collection of helpers for [MaterialStateProperty].
mixin MaterialStateHelper {
  /// Returns the given value as [MaterialStateProperty.all].
  MaterialStateProperty<T> all<T>(T value) =>
      MaterialStateProperty.all<T>(value);
}
