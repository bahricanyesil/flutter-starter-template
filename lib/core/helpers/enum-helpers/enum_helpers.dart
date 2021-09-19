import '../../constants/enums/app_themes.dart';
import '../../constants/enums/language_options.dart';

// ignore: avoid_classes_with_only_static_members
class EnumHelpers {
  static LanguageOptions langFromString(String option) {
    switch (option) {
      case 'en':
        return LanguageOptions.en;
      case 'tr':
        return LanguageOptions.tr;
      default:
        return LanguageOptions.en;
    }
  }

  static AppThemes themeFromString(String themeInString) {
    switch (themeInString) {
      case 'light':
        return AppThemes.lightTheme;
      case 'dark':
        return AppThemes.darkTheme;
      default:
        return AppThemes.lightTheme;
    }
  }
}
