import 'package:flutter/material.dart';

import '../constants/constants_shelf.dart';
import '../constants/enums/app_themes.dart';
import '../helpers/enum-helpers/enum_helpers.dart';
import '../managers/local/local_manager.dart';
import '../theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData? _theme;
  AppThemes _themeEnum = AppThemes.lightTheme;

  AppThemes get currenThemeEnum => _themeEnum;

  ThemeData getCurrentTheme() {
    if (_theme == null) {
      _getStoredTheme();
    }
    return _theme!;
  }

  void _getStoredTheme() {
    final String? storedTheme =
        LocalManager.instance.getString(LocalManagerKeys.theme);
    if (storedTheme != null) {
      _themeEnum = EnumHelpers.themeFromString(storedTheme);
    }
    if (_themeEnum == AppThemes.lightTheme) {
      _theme = LightAppTheme().createTheme();
    } else {
      _theme = DarkAppTheme().createTheme();
    }
  }

  Future<void> setTheme(AppThemes theme) async {
    if (theme == AppThemes.lightTheme) {
      _theme = LightAppTheme().createTheme();
    } else {
      _theme = DarkAppTheme().createTheme();
    }
    _themeEnum = theme;
    await LocalManager.instance
        .setString(LocalManagerKeys.theme, _themeEnum.value);
    notifyListeners();
  }

  Future<void> switchTheme() async {
    if (_themeEnum == AppThemes.lightTheme) {
      await setTheme(AppThemes.darkTheme);
    } else {
      await setTheme(AppThemes.lightTheme);
    }
    notifyListeners();
  }

  bool isDark() => _themeEnum == AppThemes.darkTheme;
}
