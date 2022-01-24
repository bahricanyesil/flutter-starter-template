import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../product/constants/enums/product_enums_shelf.dart';
import '../../../product/managers/local-storage/settings/settings_local_manager.dart';
import '../../extensions/string/type_conversion_extensions.dart';
import 'app_localizations.dart';

/// Provider of language, manages language actions.
class LanguageProvider extends ChangeNotifier {
  static Locale? _appLocale;
  static LanguageOptions _lang = LanguageOptions.en;

  /// Current language of the app.
  LanguageOptions get language => _lang;

  /// Current app locale for the current language.
  Locale get appLocal {
    if (_appLocale == null) _getStoredLang();
    return _appLocale!;
  }

  /// Supported [Locale]s in the app.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en', 'US'),
    Locale('tr', 'TR'),
  ];

  /// List of delegates.
  static const List<LocalizationsDelegate<dynamic>> delegates =
      <LocalizationsDelegate<dynamic>>[
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  void _getStoredLang() {
    final LanguageOptions? storedLang = SettingsLocalManager.instance
        .get(SettingsOptions.language)
        ?.toEnum<LanguageOptions>(LanguageOptions.values);
    if (storedLang != null) _lang = storedLang;
    _assignLanguage(_lang);
    _appLocale ??= supportedLocales[0];
  }

  void _assignLanguage(LanguageOptions language) {
    final Locale? newLocale = supportedLocales.firstWhereOrNull(
        (Locale el) => el.languageCode.toLowerCase() == language.name);
    if (newLocale != null) _appLocale = newLocale;
  }

  /// Sets the current language to the given one.
  Future<void> setLanguage(LanguageOptions language) async {
    _assignLanguage(language);
    _lang = language;
    await SettingsLocalManager.instance
        .set(SettingsOptions.language, _lang.name);
    notifyListeners();
  }

  /// Locale list resolution callback.
  Locale localeCallback(List<Locale>? locales) => appLocal;

  /// Returns whether the current language is English.
  bool get isEnglish => _lang == LanguageOptions.en;
}
