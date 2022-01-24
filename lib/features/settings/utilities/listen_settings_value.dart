import 'package:flutter/material.dart';
import '../view-model/settings_view_model.dart';

/// A utility to listen a specific value in [SettingsViewModel].
mixin ListenSettingsValue on StatelessWidget {
  /// Retunrs the visibility status of the section.
  /*bool listenVisibleSection(BuildContext context, TaskStatus status) =>
      context.select<SettingsViewModel, bool>((SettingsViewModel model) =>
          model.visibleSections[TaskStatus.values.indexOf(status)]);*/
}
