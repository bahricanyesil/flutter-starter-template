import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/managers/managers_shelf.dart';
import 'core/providers/providers_shelf.dart';

Future<void> main() async {
  await _initAll();
  runApp(
    MultiProvider(
      providers: ApplicationProvider.instance.dependItems,
      child: const App(),
    ),
  );
}

Future<void> _initAll() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalManager().initPrefs();
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
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
