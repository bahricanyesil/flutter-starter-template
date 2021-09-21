import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/managers/managers_shelf.dart';

import 'core/providers/providers_shelf.dart';

class InitialApp extends StatelessWidget {
  const InitialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: ApplicationProvider.instance.dependItems,
        child: FutureBuilder<void>(
          future: _initialize(),
          builder: _buildFuture,
        ),
      );

  Widget _buildFuture(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.connectionState != ConnectionState.done) {
      return const Center(child: CircularProgressIndicator());
    }

    return MaterialApp(
      title: 'Flutter Starter Template',
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeProvider>().getCurrentTheme(),
      localizationsDelegates: AppLocalizations.localDelegates,
      supportedLocales: AppLocalizations.locales,
      locale: context.watch<LanguageProvider>().appLocal,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationManager.instance.navigatorKey,
      localeListResolutionCallback: (List<Locale>? locales,
              Iterable<Locale> supportedLocales) =>
          context.read<LanguageProvider>().getStoredLang() ??
          AppLocalizations.localeCallback(locales, supportedLocales, context),
    );
  }

  Future<void> _initialize() async {
    await LocalManager().initLocalStorage();
  }
}
