import 'package:flutter/material.dart';

import '../../../extensions/context/context_extensions_shelf.dart';
import '../../texts/base_text.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: context.medEdgeInsets,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _getLoadingIndicator(context),
            _getHeading(context),
          ],
        ),
      );

  Padding _getLoadingIndicator(BuildContext context) => Padding(
        padding: context.bottomMed,
        child: SizedBox(
          width: context.height * 6,
          height: context.height * 6,
          child: Center(
            child: CircularProgressIndicator(
              color: context.accentColor,
              strokeWidth: 3,
            ),
          ),
        ),
      );

  Widget _getHeading(BuildContext context) => Padding(
        padding: context.bottomLow,
        child: BaseText(
          'Please Wait...',
          style: context.headline4.copyWith(color: context.primaryColor),
        ),
      );
}
