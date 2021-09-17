import 'package:flutter/material.dart';

import '../../extensions/context/context_extensions_shelf.dart';

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
          FittedBox(child: Text(firstText)),
          SizedBox(width: context.width),
          registerTextButton(context),
        ],
      );

  Widget registerTextButton(BuildContext context) => TextButton(
        onPressed: action,
        child: FittedBox(
          child: Text(
            secondText,
            style: context.headline4.copyWith(color: context.primaryColor),
          ),
        ),
      );
}
