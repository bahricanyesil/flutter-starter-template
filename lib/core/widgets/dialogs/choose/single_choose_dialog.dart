import 'package:flutter/material.dart';

import '../../../constants/border/shape_borders.dart';
import '../../../extensions/context/context_extensions_shelf.dart';
import '../../texts/base_text.dart';

class SingleChooseDialog<T> extends StatelessWidget {
  final String title;
  final List<T> elements;
  const SingleChooseDialog(
      {required this.title, required this.elements, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleDialog(
        shape: ShapedBorders.roundedMedium,
        backgroundColor: context.canvasColor,
        title: BaseText(
          title,
          style: context.headline4.copyWith(color: context.primaryColor),
        ),
        children: _getDialogChildren(elements, context),
      );

  List<Column> _getDialogChildren(List<T> elements, BuildContext context) =>
      List<Column>.generate(
        elements.length,
        (int index) => Column(
          children: <Widget>[
            if (index == 0) _getDivider(context),
            _getSimpleDialogOption(index, elements, context),
            _getDivider(context),
          ],
        ),
      );

  SimpleDialogOption _getSimpleDialogOption(
          int index, List<T> elements, BuildContext context) =>
      SimpleDialogOption(
        onPressed: () => Navigator.of(context).pop(index),
        child: BaseText(
          elements[index].toString(),
          style: context.headline5
              .copyWith(color: context.primaryLightColor.withOpacity(.8)),
        ),
      );

  Widget _getDivider(BuildContext context) => Divider(
        color: context.primaryColor,
        thickness: context.height * .1,
      );
}
