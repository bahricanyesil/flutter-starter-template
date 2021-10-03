import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helpers/device-type/device_type_helper.dart';
import '../../providers/theme_provider.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => watch<ThemeProvider>().currentTheme;
  Color get primaryColor => theme.primaryColor;
  Color get accentColor => theme.colorScheme.secondary;
  Color get canvasColor => theme.canvasColor.withOpacity(.85);
  Color get errorColor => theme.errorColor;
  Color get primaryLightColor => theme.primaryColorLight;
  Color get primaryDarkColor => theme.primaryColorDark.withOpacity(.8);

  TextStyle get headline1 => _getStyle(theme.textTheme.headline1!);
  TextStyle get headline2 => _getStyle(theme.textTheme.headline2!);
  TextStyle get headline3 => _getStyle(theme.textTheme.headline3!);
  TextStyle get headline4 => _getStyle(theme.textTheme.headline4!);
  TextStyle get headline5 => _getStyle(theme.textTheme.headline5!);
  TextStyle get headline6 => _getStyle(theme.textTheme.headline6!);

  TextStyle get subtitle1 => _getStyle(theme.textTheme.subtitle1!);
  TextStyle get subtitle2 => _getStyle(theme.textTheme.subtitle2!);

  TextStyle get bodyText1 => _getStyle(theme.textTheme.bodyText1!);
  TextStyle get bodyText2 => _getStyle(theme.textTheme.bodyText2!);

  TextStyle _getStyle(TextStyle style) {
    final double oldSize = style.fontSize!;
    return DeviceTypeHelper(this).isLandscape
        ? style.copyWith(fontSize: pow(oldSize, 1.18) * 1)
        : style;
  }
}
