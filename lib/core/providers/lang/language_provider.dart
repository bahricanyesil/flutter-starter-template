import 'package:flutter/material.dart';

import '../../constants/enums/language_options.dart';
import '../../constants/enums/local_manager_keys.dart';
import '../../helpers/enum-helpers/enum_helpers.dart';
import '../../managers/local/local_manager.dart';
import 'app_localizations.dart';

class LanguageProvider extends ChangeNotifier {
  static Locale? _appLocale;
  static LanguageOptions _lang = LanguageOptions.en;

  Locale? get appLocal => _appLocale;
  LanguageOptions get language => _lang;

  Locale? getStoredLang() {
    final String? langCode =
        LocalManager.instance.getString(LocalManagerKeys.langCode);
    if (langCode != null) {
      _lang = EnumHelpers.langFromString(langCode);
      if (_lang == LanguageOptions.en) {
        setLanguage(LanguageOptions.en);
      } else {
        setLanguage(LanguageOptions.tr);
      }
    }
    return _appLocale;
  }

  Future<void> setLanguage(LanguageOptions lang) async {
    _lang = lang;
    _appLocale = AppLocalizations.locales
        .where((Locale e) => e.languageCode == lang.value)
        .first;
    await LocalManager.instance
        .setString(LocalManagerKeys.langCode, lang.value);
    notifyListeners();
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
