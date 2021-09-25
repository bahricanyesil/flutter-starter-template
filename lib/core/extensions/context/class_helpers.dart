import 'package:flutter/material.dart';
import '../../providers/lang/app_localizations.dart';

extension ClassHelpers on BuildContext {
  String tr(String key) => AppLocalizations.of(this)!.translate(key);
}
