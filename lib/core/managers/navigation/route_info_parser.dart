import 'package:flutter/material.dart';
import '../../constants/constants_shelf.dart';

import 'screen_config.dart';

/// Custom route information parser.
class CustomRouteInfoParser extends RouteInformationParser<ScreenConfig> {
  /// The default screen to show when the app launches.
  ScreenConfig defaultScreen = ScreenConfig.login();

  @override
  Future<ScreenConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    final Uri uri = Uri.parse(routeInformation.location ?? defaultScreen.path);
    if (uri.pathSegments.isEmpty) return defaultScreen;
    switch ('/${uri.pathSegments[0]}') {
      case NavigationConstants.home:
        return ScreenConfig.home();
      case NavigationConstants.settings:
        return ScreenConfig.settings();
    }
    return defaultScreen;
  }

  @override
  RouteInformation? restoreRouteInformation(ScreenConfig configuration) {
    if (configuration.path == defaultScreen.path) return null;
    return RouteInformation(location: configuration.path);
  }
}
