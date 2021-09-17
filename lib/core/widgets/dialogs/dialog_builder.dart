import 'package:flutter/material.dart';

import '../../constants/border/shape_borders.dart';
import '../../decoration/texts/text_form_styles.dart';
import '../../extensions/context/context_extensions_shelf.dart';
import 'custom/custom_dialogs_shelf.dart';
import 'dialogs_shelf.dart';

class DialogBuilder {
  const DialogBuilder(this.context);
  final BuildContext context;

  Future<void> showLoadingIndicator() async => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            shape: ShapedBorders.roundedMedium,
            backgroundColor: context.canvasColor,
            content: const LoadingIndicator(),
          ),
        ),
      );

  Future<void> textFieldDialog({
    required String title,
    required TextEditingController controller,
    required Future<void> Function() action,
    String hintText = '',
  }) async =>
      CustomDialog(
        title: title,
        action: action,
        content: TextField(
          controller: controller,
          decoration: TextFormDeco(context).dialogText(hintText: hintText),
          style: context.headline5,
        ),
      ).show(context);

  Future<int?> showSelectDialog<T>(String title, List<T> elements) async =>
      showDialog<int>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) =>
            SingleChooseDialog<T>(title: title, elements: elements),
      );

  Future<List<String>?> showMultipleSelectDialog(
    String title,
    List<String> elements, {
    bool enableSearch = false,
    List<String> initialSelecteds = const <String>[],
  }) async =>
      showDialog<List<String>>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => MultipleChooseDialog(
          title: title,
          elements: elements,
          enableSearch: enableSearch,
          initialSelecteds: initialSelecteds,
        ),
      );

  Future<void> showTextDialog(String text) async {
    await CustomDialog(
      content: Padding(
        padding: EdgeInsets.all(context.width),
        child: FittedBox(
          child:
              Text(text, textAlign: TextAlign.center, style: context.headline5),
        ),
      ),
    ).show(context);
  }
}
