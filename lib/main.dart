import 'package:flutter/material.dart';

import 'core/managers/local/local_manager.dart';

Future<void> main() async {
  await LocalManager.instance.initPrefs();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Starter Template',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const Text('HEY'),
      );
}
