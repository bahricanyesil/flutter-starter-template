import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../managers/navigation/navigation_manager.dart';
import 'lang/language_provider.dart';
import 'providers_shelf.dart';

class ApplicationProvider {
  factory ApplicationProvider() => _instance;
  static final ApplicationProvider _instance = ApplicationProvider._();
  static ApplicationProvider get instance => _instance;

  ApplicationProvider._();

  List<SingleChildWidget> singleItems = <SingleChildWidget>[];
  List<SingleChildWidget> dependItems = <SingleChildWidget>[
    ChangeNotifierProvider<ThemeProvider>(
      create: (BuildContext context) => ThemeProvider(),
    ),
    ChangeNotifierProvider<LanguageProvider>(
      create: (BuildContext context) => LanguageProvider(),
    ),
    Provider<NavigationManager>.value(value: NavigationManager.instance)
  ];
  List<SingleChildWidget> uiChangesItems = <SingleChildWidget>[];
}
