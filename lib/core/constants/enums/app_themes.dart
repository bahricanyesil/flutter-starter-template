enum AppThemes {
  lightTheme,
  darkTheme,
}

extension ThemeToString on AppThemes {
  String get value {
    switch (this) {
      case AppThemes.lightTheme:
        return 'light';
      case AppThemes.darkTheme:
        return 'dark';
      default:
        return 'light';
    }
  }
}
