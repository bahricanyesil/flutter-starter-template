import 'package:flutter/material.dart';

import '../text_theme.dart';

class DarkTextTheme extends ITextTheme {
  DarkTextTheme()
      : super(
          primaryTextColor: Colors.white,
          secondaryTextColor: const Color(0xff616161),
        );
}
