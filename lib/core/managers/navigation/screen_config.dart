import 'package:flutter/material.dart';

import '../../../features/screens_shelf.dart';

class ScreenConfig {
  final String path;
  final Widget Function() builder;

  const ScreenConfig({
    required this.path,
    required this.builder,
  });

  Route<Widget> get toRoute =>
      MaterialPageRoute<Widget>(builder: (BuildContext context) => builder());

  ScreenConfig.login()
      : path = '/login',
        builder = (() => const LoginScreen());

  ScreenConfig.home()
      : path = '/home',
        builder = (() => const HomeScreen());
}
