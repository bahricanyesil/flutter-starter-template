enum LanguageOptions {
  en,
  tr,
}

extension LangToString on LanguageOptions {
  String get value {
    switch (this) {
      case LanguageOptions.en:
        return 'en';
      case LanguageOptions.tr:
        return 'tr';
      default:
        return 'en';
    }
  }
}
