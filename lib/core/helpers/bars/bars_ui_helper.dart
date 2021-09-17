import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BarsUiHelper {
  final BuildContext context;
  const BarsUiHelper(this.context);

  static void setSystemUi() {
    // TODO(bahrican): Determine isDark with real value
    final bool isDark = true;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(isDark ? 0xffffff : 0xff121212),
        statusBarColor: Color(isDark ? 0xff3280c0 : 0xff616161),
        systemNavigationBarIconBrightness:
            isDark ? Brightness.dark : Brightness.light,
      ),
    );
  }
}
