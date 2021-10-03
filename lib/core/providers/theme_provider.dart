import 'package:flutter/material.dart';

import '../constants/constants_shelf.dart';
import '../extensions/string/nullable_extensions.dart';
import '../managers/local/local_manager.dart';
import '../theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData? _theme;
  AppThemes _themeEnum = AppThemes.light;

  AppThemes get currenThemeEnum => _themeEnum;

  ThemeData get currentTheme {
    if (_theme == null) _getStoredTheme();
    return _theme!;
  }

  void _getStoredTheme() {
    final AppThemes? storedTheme = LocalManager.instance
        .getUserPreference(UserPreferencesKeys.theme)
        .toEnum<AppThemes>(AppThemes.values);
    if (storedTheme != null) _themeEnum = storedTheme;
    _assignTheme(_themeEnum);
  }

  void _assignTheme(AppThemes themeEnum) {
    if (themeEnum == AppThemes.light) {
      _theme = LightAppTheme().createTheme;
    } else if (themeEnum == AppThemes.dark) {
      _theme = DarkAppTheme().createTheme;
    }
  }

  Future<void> setTheme(AppThemes themeEnum) async {
    _assignTheme(themeEnum);
    _themeEnum = themeEnum;
    await LocalManager.instance
        .setUserPreference(UserPreferencesKeys.theme, _themeEnum);
    notifyListeners();
  }

  Future<void> switchTheme() async {
    if (_themeEnum == AppThemes.light) {
      await setTheme(AppThemes.dark);
    } else if (_themeEnum == AppThemes.dark) {
      await setTheme(AppThemes.light);
    }
  }

  bool get isDark => _themeEnum == AppThemes.dark;
}
