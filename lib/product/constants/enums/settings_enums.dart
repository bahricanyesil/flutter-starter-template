import 'package:flutter/material.dart';

/// Represents the settings options.
enum SettingsOptions {
  /// Indicates the selected language.
  language,

  /// Indicates the theme of the app.
  theme,

  /// Indicates the section includes info about the app.
  info,

  /// Indicates the section for social media accounts of the developer.
  socialInfo,
}

/// Extensions on [SettingsOptions].
extension StringSettingsValues on SettingsOptions {
  /// Returns the title of the settings option.
  String get title {
    switch (this) {
      case SettingsOptions.language:
        return 'language';
      case SettingsOptions.theme:
        return 'theme';
      case SettingsOptions.info:
        return 'info';
      case SettingsOptions.socialInfo:
        return 'social_info';
    }
  }

  /// Returns the subtitle of the settings option.
  String get subtitle {
    switch (this) {
      case SettingsOptions.language:
        return 'language_subtitle';
      case SettingsOptions.theme:
        return 'theme_subtitle';
      case SettingsOptions.info:
        return 'info_subtitle';
      case SettingsOptions.socialInfo:
        return 'social_info_subtitle';
    }
  }

  /// Returns the corresponding icon for the settings option.
  IconData get icon {
    switch (this) {
      case SettingsOptions.language:
        return Icons.language_outlined;
      case SettingsOptions.theme:
        return Icons.dark_mode_outlined;
      case SettingsOptions.info:
        return Icons.info_outline;
      case SettingsOptions.socialInfo:
        return Icons.contact_mail_outlined;
    }
  }

  /// Returns whether the settings option shoul be an expansion tile.
  bool get isExpansionTile {
    switch (this) {
      case SettingsOptions.theme:
        return false;
      default:
        return true;
    }
  }
}
