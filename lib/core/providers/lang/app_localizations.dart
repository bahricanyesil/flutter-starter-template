import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'language_provider.dart';

class AppLocalizations {
  final Locale _locale;
  AppLocalizations(this._locale);

  static AppLocalizations? of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Map<String, String> _localizedValues = <String, String>{};

  Future<void> load() async {
    final String jsonStringValues =
        await rootBundle.loadString('assets/lang/${_locale.languageCode}.json');
    final Map<String, String> mappedJson =
        Map.castFrom(await json.decode(jsonStringValues));
    _localizedValues = mappedJson.map((String key, String value) =>
        MapEntry<String, String>(key, value.toString()));
  }

  String translate(String key) => _localizedValues[key] ?? 'Not Found';
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => LanguageProvider.supportedLocales
      .where((Locale el) => el.languageCode == locale.languageCode)
      .isNotEmpty;

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final AppLocalizations localization = AppLocalizations(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
