import 'package:flutter/material.dart';
import '../../constants/navigation/navigation_constants.dart';
import 'navigation_manager.dart';

import 'screen_config.dart';

/// Route information parser
class CustomRouteInfoParser extends RouteInformationParser<ScreenConfig> {
  /// Default screen to route in any unexpected situation.
  final ScreenConfig defaultScreen = ScreenConfig.defaultScreen();

  @override
  Future<ScreenConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    final Uri uri =
        Uri.parse(routeInformation.location ?? NavigationConstants.root);
    if (uri.pathSegments.isEmpty) return defaultScreen;
    switch (uri.pathSegments[0]) {
      case NavigationConstants.root:
        return ScreenConfig.defaultScreen();
      case NavigationConstants.home:
        return ScreenConfig.home();
    }

    return defaultScreen;
  }

  @override
  RouteInformation? restoreRouteInformation(ScreenConfig configuration) {
    if (configuration.path == NavigationManager.instance.initialScreen?.path) {
      return null;
    }
    return RouteInformation(location: configuration.path);
  }
}
