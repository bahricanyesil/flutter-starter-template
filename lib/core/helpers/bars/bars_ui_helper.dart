import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

class BarsUiHelper {
  final BuildContext context;
  const BarsUiHelper(this.context);

  void setSystemUi() {
    final bool isDark = context.read<ThemeProvider>().isDark;
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
