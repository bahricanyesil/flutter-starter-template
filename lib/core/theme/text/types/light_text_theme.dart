import 'package:flutter/material.dart';

import '../text_theme.dart';

class LightTextTheme extends ITextTheme {
  LightTextTheme()
      : super(
          primaryTextColor: Colors.white,
          secondaryTextColor: const Color(0xff616161),
        );
}
