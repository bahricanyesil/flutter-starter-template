import 'package:flutter/material.dart';

import '../../providers/language/app_localizations.dart';

/// Context extension for language helpers.
extension LanguageHelpers on BuildContext {
  /// Returns the translated text for given key.
  String tr(String key) => AppLocalizations.of(this)?.translate(key) ?? key;
}
