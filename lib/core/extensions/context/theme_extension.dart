import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => watch<ThemeProvider>().currentTheme;
  Color get primaryColor => theme.primaryColor;
  Color get accentColor => theme.colorScheme.secondary;
  Color get canvasColor => theme.canvasColor.withOpacity(.85);
  Color get errorColor => theme.errorColor;
  Color get primaryLightColor => theme.primaryColorLight;
  Color get primaryDarkColor => theme.primaryColorDark.withOpacity(.8);

  TextStyle get headline1 => theme.textTheme.headline1!;
  TextStyle get headline2 => theme.textTheme.headline2!;
  TextStyle get headline3 => theme.textTheme.headline3!;
  TextStyle get headline4 => theme.textTheme.headline4!;
  TextStyle get headline5 => theme.textTheme.headline5!;
  TextStyle get headline6 => theme.textTheme.headline6!;

  TextStyle get subtitle1 => theme.textTheme.subtitle1!;
  TextStyle get subtitle2 => theme.textTheme.subtitle2!;

  TextStyle get bodyText1 => theme.textTheme.bodyText1!;
  TextStyle get bodyText2 => theme.textTheme.bodyText2!;
}
