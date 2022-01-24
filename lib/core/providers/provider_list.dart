import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/view_models_shelf.dart';
import '../managers/navigation/navigation_manager.dart';
import 'language/language_provider.dart';
import 'theme/theme_provider.dart';

/// Provides the list of providers will be used across the app.
class ProviderList {
  /// Singleton instance of [ProviderList].
  factory ProviderList() => _instance;
  ProviderList._();
  static final ProviderList _instance = ProviderList._();

  /// List of providers will be used for main [MultiProvider] class.
  static final List<SingleChildWidget> providers = <SingleChildWidget>[
    ..._functionalProviders,
    ..._viewModelProviders,
  ];

  static final List<SingleChildWidget> _viewModelProviders =
      <SingleChildWidget>[
    ChangeNotifierProvider<HomeViewModel>(
      create: (BuildContext context) => HomeViewModel(),
    ),
    ChangeNotifierProvider<SettingsViewModel>(
      create: (BuildContext context) => SettingsViewModel(),
    ),
  ];

  static final List<SingleChildWidget> _functionalProviders =
      <SingleChildWidget>[
    ChangeNotifierProvider<ThemeProvider>(
      create: (BuildContext context) => ThemeProvider(),
    ),
    ChangeNotifierProvider<LanguageProvider>(
      create: (BuildContext context) => LanguageProvider(),
    ),
    ChangeNotifierProvider<NavigationManager>(
      create: (BuildContext context) => NavigationManager(),
    ),
  ];
}
