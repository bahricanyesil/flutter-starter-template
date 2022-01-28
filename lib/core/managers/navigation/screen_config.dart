import 'package:flutter/material.dart';

import '../../../features/screens_shelf.dart';
import '../../constants/navigation/navigation_constants.dart';
import '../../helpers/hasher.dart';

@immutable

/// [ScreenConfig] class to determine the properties of pages to navigate.
class ScreenConfig {
  /// Constructor for [ScreenConfig] class.
  const ScreenConfig({
    required this.path,
    required this.builder,
    this.arguments = const <String, dynamic>{},
  });

  /// Screen config for the [HomeScreen].
  ScreenConfig.home({Map<String, dynamic> args = const <String, dynamic>{}})
      : path = NavigationConstants.home,
        builder = (() => const SplashScreen()),
        arguments = args;

  /// Screen config for the [SettingsScreen]
  ScreenConfig.settings({Map<String, dynamic> args = const <String, dynamic>{}})
      : path = NavigationConstants.settings,
        builder = (() => const SettingsScreen()),
        arguments = args;

  /// Screen config for the [LoginScreen]
  ScreenConfig.login({Map<String, dynamic> args = const <String, dynamic>{}})
      : path = NavigationConstants.login,
        builder = (() => const LoginScreen()),
        arguments = args;

  /// Path of the page, will be the url on web.
  final String path;

  /// Builder method to navigate to the page.
  final Widget Function() builder;

  /// Arguments will be passed to the new screen.
  final Map<String, dynamic> arguments;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is ScreenConfig && other.path == path;
  }

  /// This hashCode part is inspired from Quiver package.
  /// Quiver package link: https://pub.dev/packages/quiver
  @override
  int get hashCode => Hasher.getHashCode(<String>[path]);
}
