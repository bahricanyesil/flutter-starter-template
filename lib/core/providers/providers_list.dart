import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/home_view_models_shelf.dart';
import '../managers/navigation/my_router_delegate.dart';
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
    ChangeNotifierProvider<HomeViewModel>(
      create: (BuildContext context) => HomeViewModel(),
    ),
    ChangeNotifierProvider<LoginViewModel>(
      create: (BuildContext context) => LoginViewModel(),
    ),
    ChangeNotifierProvider<NavigationManager>(
      create: (BuildContext context) => NavigationManager(),
    ),
  ];
  List<SingleChildWidget> uiChangesItems = <SingleChildWidget>[];
}
