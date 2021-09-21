import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../constants/enums/language_options.dart';
import '../../constants/enums/local-storage/user_preferences_keys.dart';
import '../../extensions/enum/enum_extensions.dart';
import '../../extensions/string/nullable_extensions.dart';
import '../../managers/local/local_manager.dart';
import 'app_localizations.dart';

class LanguageProvider extends ChangeNotifier {
  static Locale? _appLocale;
  static LanguageOptions _lang = LanguageOptions.en;

  Locale? get appLocal => _appLocale;
  LanguageOptions get language => _lang;

  Locale? getStoredLang() {
    final LanguageOptions? storedLangOption = LocalManager.instance
        .getUserPreference(UserPreferencesKeys.language)
        .toEnum(LanguageOptions.values);
    if (storedLangOption != null) {
      _lang = storedLangOption;
      if (_lang == LanguageOptions.en) {
        setLanguage(LanguageOptions.en);
      } else {
        setLanguage(LanguageOptions.tr);
      }
    }
    return _appLocale;
  }

  Future<void> setLanguage(LanguageOptions lang) async {
    final Locale? newLocale = AppLocalizations.locales
        .firstWhereOrNull((Locale e) => e.languageCode == lang.value);
    if (newLocale != null) {
      _lang = lang;
      _appLocale = newLocale;
      await LocalManager.instance
          .setUserPreference(UserPreferencesKeys.language, lang);
      notifyListeners();
    }
  }

  Future<void> switchLanguage() async {
    if (_lang == LanguageOptions.en) {
      await setLanguage(LanguageOptions.tr);
    } else {
      await setLanguage(LanguageOptions.en);
    }
    notifyListeners();
  }

  Future<void> setLanguageWithLocale(Locale locale) async {
    if (AppLocalizations.locales.contains(locale)) {
      if (locale.languageCode == LanguageOptions.en.value) {
        await setLanguage(LanguageOptions.en);
      } else {
        await setLanguage(LanguageOptions.tr);
      }
    }
  }
}
