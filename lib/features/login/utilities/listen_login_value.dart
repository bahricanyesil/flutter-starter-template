import 'package:animated_login/animated_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view-model/login_view_model.dart';

/// A utility to listen a specific value in [LoginViewModel].
mixin ListenLoginValue {
  /// Listens a specific value.
  T listenValue<T>(
          BuildContext context, T Function(LoginViewModel model) func) =>
      context.select<LoginViewModel, T>(func);

  /// Listens the auth mode in the [LoginViewModel].
  AuthMode listenAuthMode(BuildContext context) => listenValue<AuthMode>(
      context, (LoginViewModel model) => model.currentMode);
}
