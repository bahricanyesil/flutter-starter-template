import 'package:flutter/material.dart';
import 'screen_config.dart';

class MyRouteInfoParser extends RouteInformationParser<ScreenConfig> {
  ScreenConfig defaultScreen = ScreenConfig.login();

  @override
  Future<ScreenConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    final Uri uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.isEmpty) return defaultScreen;
    switch (uri.pathSegments[0]) {
      case 'login':
        return ScreenConfig.login();
      case 'home':
        return ScreenConfig.home();
    }

    return defaultScreen;
  }

  @override
  RouteInformation? restoreRouteInformation(ScreenConfig configuration) {
    if (configuration.path == defaultScreen.path) return null;
    return RouteInformation(location: configuration.path);
  }
}
