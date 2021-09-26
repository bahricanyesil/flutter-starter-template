import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:provider/provider.dart';

import 'core/managers/managers_shelf.dart';
import 'core/managers/navigation/my_route_info_parser.dart';
import 'core/managers/navigation/my_router_delegate.dart';
import 'core/providers/providers_shelf.dart';

class Init extends StatelessWidget {
  Init({Key? key}) : super(key: key);

  final NavigationManager _routerDelegate = NavigationManager();
  final MyRouteInfoParser _routeInfoParser = MyRouteInfoParser();

  @override
  Widget build(BuildContext context) => FutureBuilder<void>(
        future: _initialize(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          return MultiProvider(
            providers: ApplicationProvider.instance.dependItems,
            child: _App(
              routerDelegate: _routerDelegate,
              routeInfoParser: _routeInfoParser,
            ),
          );
        },
      );

  Future<void> _initialize() async {
    // if (kIsWeb) setUrlStrategy(PathUrlStrategy());
    await LocalManager().initLocalStorage();
    _routeInfoParser.defaultScreen = ScreenConfig.login();
    await _routerDelegate.setInitialRoutePath(_routeInfoParser.defaultScreen);
  }
}

class _App extends StatelessWidget {
  final NavigationManager routerDelegate;
  final MyRouteInfoParser routeInfoParser;
  const _App({
    required this.routerDelegate,
    required this.routeInfoParser,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Flutter Starter Template',
        debugShowCheckedModeBanner: false,
        theme: context.watch<ThemeProvider>().getCurrentTheme(),
        localizationsDelegates: LanguageProvider.delegates,
        supportedLocales: LanguageProvider.supportedLocales,
        locale: context.watch<LanguageProvider>().appLocal,
        routerDelegate: routerDelegate,
        backButtonDispatcher: RootBackButtonDispatcher(),
        routeInformationParser: routeInfoParser,
        localeListResolutionCallback: (List<Locale>? locales, _) =>
            context.read<LanguageProvider>().localeCallback(locales),
      );
}
