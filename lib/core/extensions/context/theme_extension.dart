import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => watch<ThemeProvider>().getCurrentTheme();
  Color get primaryColor => theme.primaryColor;
  Color get accentColor => theme.colorScheme.secondary;
  Color get canvasColor => theme.canvasColor.withOpacity(.8);
  Color get errorColor => theme.errorColor;
  Color get primaryLightColor => theme.primaryColorLight;
  Color get primaryDarkColor => theme.primaryColorDark.withOpacity(.8);

  TextStyle get headline1 => theme.textTheme.headline1!;
  TextStyle get headline2 => theme.textTheme.headline2!;
  TextStyle get headline3 => theme.textTheme.headline3!;
  TextStyle get headline4 => theme.textTheme.headline4!;
  TextStyle get headline5 => theme.textTheme.headline5!;
  TextStyle get headline6 => theme.textTheme.headline6!;
}
