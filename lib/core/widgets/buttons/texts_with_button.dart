import 'package:flutter/material.dart';

import '../../extensions/context/context_extensions_shelf.dart';
import '../texts/base_text.dart';

class TextsWithButton extends StatelessWidget {
  const TextsWithButton({
    required this.firstText,
    required this.secondText,
    required this.action,
    Key? key,
  }) : super(key: key);
  final String firstText;
  final String secondText;
  final Function() action;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BaseText(firstText, textStyle: context.headline4),
          SizedBox(width: context.width),
          _textButton(context),
        ],
      );

  Widget _textButton(BuildContext context) => TextButton(
        onPressed: action,
        child: BaseText(
          secondText,
          textStyle: context.headline4.copyWith(color: context.primaryColor),
        ),
      );
}
