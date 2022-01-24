import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view-model/home_view_model.dart';

/// A utility to listen a specific value in [HomeViewModel].
mixin ListenHomeValue {
  /// Listens a specific value.
  T listenValue<T>(
          BuildContext context, T Function(HomeViewModel model) func) =>
      context.select<HomeViewModel, T>(func);
}
