import 'package:flutter/material.dart';

import '../../../features/screens_shelf.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  factory NavigationRoute() => _instance;
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    final Map<String, dynamic> arguments = getArguments(args);
    switch (args.name) {
      case NavigationConstants.login:
        return normalNavigate(const LoginScreen());
      case NavigationConstants.home:
        return normalNavigate(const HomeScreen());
      // TODO(bahrican):
      default:
        return normalNavigate(const HomeScreen());
    }
  }

  MaterialPageRoute<Widget> normalNavigate(Widget widget) =>
      MaterialPageRoute<Widget>(
        builder: (BuildContext context) => widget,
      );

  Map<String, dynamic> getArguments(RouteSettings args) {
    Map<String, dynamic> arguments;
    try {
      arguments =
          args.arguments as Map<String, dynamic>? ?? <String, dynamic>{};
    } on Exception {
      arguments = <String, dynamic>{};
    }
    return arguments;
  }
}
