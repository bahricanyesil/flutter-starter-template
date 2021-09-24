import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../constants/enums/language_options.dart';
import '../../constants/enums/local-storage/user_preferences_keys.dart';
import '../../extensions/enum/enum_extensions.dart';
import '../../extensions/string/nullable_extensions.dart';
import '../../managers/local/local_manager.dart';
import 'app_localizations.dart';

class LanguageProvider extends ChangeNotifier {
  static Locale? _appLocale;
  static LanguageOptions? _lang;

  Locale? get appLocal => _appLocale;
  LanguageOptions? get language => _lang;

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en', 'US'),
    Locale('tr', 'TR'),
  ];

  static const List<LocalizationsDelegate<dynamic>> delegates =
      <LocalizationsDelegate<dynamic>>[
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  Locale? getStoredLang() {
    final LanguageOptions? storedLangOption = LocalManager.instance
        .getUserPreference(UserPreferencesKeys.language)
        .toEnum(LanguageOptions.values);

    if (storedLangOption != null && _lang != storedLangOption) {
      _lang = storedLangOption;
      if (_lang == LanguageOptions.en) {
        setLanguage(LanguageOptions.en, false);
      } else {
        setLanguage(LanguageOptions.tr, false);
      }
    }
    return _appLocale;
  }

  Future<void> setLanguage(LanguageOptions lang, [bool notify = true]) async {
    final Locale? newLocale = supportedLocales
        .firstWhereOrNull((Locale e) => e.languageCode == lang.value);
    if (newLocale != null) {
      _lang = lang;
      _appLocale = newLocale;
      await LocalManager.instance
          .setUserPreference(UserPreferencesKeys.language, lang);
      if (notify) notifyListeners();
    }
  }

  Future<void> switchLanguage() async {
    if (_lang == LanguageOptions.en) {
      await setLanguage(LanguageOptions.tr);
    } else if (_lang == LanguageOptions.tr) {
      await setLanguage(LanguageOptions.en);
    }
  }

  Future<void> setLanguageWithLocale(Locale locale) async {
    if (supportedLocales.contains(locale)) {
      if (locale.languageCode == LanguageOptions.en.value) {
        await setLanguage(LanguageOptions.en);
      } else {
        await setLanguage(LanguageOptions.tr);
      }
    }
  }

  Locale localeCallback(List<Locale>? locales) {
    if (_appLocale != null) return _appLocale!;
    final Locale? storedLang = getStoredLang();
    if (storedLang != null) return storedLang;
    if (locales != null) {
      for (final Locale locale in locales) {
        if (supportedLocales.contains(locale)) {
          if (_appLocale != locale) setLanguageWithLocale(locale);
          return locale;
        }
      }
    }
    return const Locale('en', 'US');
  }
}
