import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/managers/managers_shelf.dart';
import 'core/providers/providers_shelf.dart';

class Init extends StatelessWidget {
  const Init({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder<void>(
        future: _initialize(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          return MultiProvider(
            providers: ApplicationProvider.instance.dependItems,
            child: const _App(),
          );
        },
      );

  Future<void> _initialize() async {
    await LocalManager().initLocalStorage();
  }
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Starter Template',
        debugShowCheckedModeBanner: false,
        theme: context.watch<ThemeProvider>().getCurrentTheme(),
        localizationsDelegates: LanguageProvider.delegates,
        supportedLocales: LanguageProvider.supportedLocales,
        locale: context.watch<LanguageProvider>().appLocal,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        navigatorKey: NavigationManager.instance.navigatorKey,
        localeListResolutionCallback: (List<Locale>? locales, _) =>
            context.read<LanguageProvider>().localeCallback(locales),
      );
}
