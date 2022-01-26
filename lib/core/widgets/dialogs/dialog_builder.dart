import 'package:flutter/material.dart';

import '../../extensions/context/responsiveness_extensions.dart';
import '../indicators/loading_indicator.dart';
import '../text/base_text.dart';

/// Builds various dialogs with different methods.
class DialogBuilder {
  /// Builds various dialogs with different methods.
  /// * e.g. [showLoadingDialog], [showResultDialog]
  const DialogBuilder(this.context);

  /// Context to show dialogs.
  final BuildContext context;

  /// Example loading dialog
  Future<void> showLoadingDialog() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => WillPopScope(
          onWillPop: () async => false,
          child: const AlertDialog(content: LoadingIndicator()),
        ),
      );

  /// Example result dialog
  Future<void> showResultDialog(String text) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: SizedBox(
            height: context.height * 40,
            width: context.width * 60,
            child: Center(child: BaseText(text, flatText: true)),
          ),
        ),
      );
}
