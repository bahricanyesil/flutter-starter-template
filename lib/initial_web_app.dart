import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'core/managers/navigation/navigation_shelf.dart';
import 'core/providers/providers_shelf.dart';

/// Material app widget of the app.
class InitialApp extends StatelessWidget {
  /// Default constructor for [InitialApp] widget.
  const InitialApp({required this.appName, Key? key}) : super(key: key);

  /// Name of the app.
  final String appName;

  @override
  Widget build(BuildContext context) {
    _initialize();
    return MaterialApp.router(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeProvider>().currentTheme,
      routerDelegate: NavigationManager(),
      backButtonDispatcher: RootBackButtonDispatcher(),
      routeInformationParser: CustomRouteInfoParser(),
      localizationsDelegates: LanguageProvider.delegates,
      supportedLocales: LanguageProvider.supportedLocales,
      locale: context.watch<LanguageProvider>().appLocal,
      localeListResolutionCallback: (List<Locale>? locales, _) =>
          context.read<LanguageProvider>().localeCallback(locales),
    );
  }

  void _initialize() => setUrlStrategy(PathUrlStrategy());
}
