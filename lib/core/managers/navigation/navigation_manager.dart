import 'package:flutter/cupertino.dart';

import 'l_navigation_manager.dart';

class NavigationManager implements INavigationManager {
  // TODO(bahrican): Replace with Navigation 2.0

  factory NavigationManager() => _instance;
  static final NavigationManager _instance = NavigationManager._init();
  static NavigationManager get instance => _instance;
  NavigationManager._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  // ignore: prefer_function_declarations_over_variables
  final RoutePredicate removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({
    String path = '/',
    Map<String, dynamic> data = const <String, dynamic>{},
  }) async {
    await navigatorKey.currentState?.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({
    String path = '/',
    Map<String, dynamic> data = const <String, dynamic>{},
  }) async {
    await navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }
}
