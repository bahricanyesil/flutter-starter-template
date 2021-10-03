import 'package:flutter/material.dart';
import '../constants/border/border_radii.dart';
import '../constants/border/shape_borders.dart';

import 'color/color_manager.dart';
import 'text/text_theme.dart';
import 'text/types/dark_text_theme.dart';
import 'text/types/light_text_theme.dart';

// TODO(bahrican): When changing a color in app, don't forget to
// check whether it has a parameter in ThemeData
abstract class ITheme {
  ITextTheme get textTheme;
  IColors get colors;

  ThemeData get createTheme => ThemeData(
        fontFamily: textTheme.fontFamily,
        textTheme: textTheme.data,
        primaryTextTheme: textTheme.data,
        cardColor: colors.colorScheme.onSecondary,
        bottomAppBarColor: colors.scaffoldBackgroundColor,
        scaffoldBackgroundColor: colors.scaffoldBackgroundColor,
        colorScheme: colors.colorScheme,
        primaryColor: colors.colorScheme.primary,
        backgroundColor: colors.scaffoldBackgroundColor,
        brightness: colors.brightness,
        primaryColorBrightness: colors.brightness,
        primaryColorLight: textTheme.primaryTextColor,
        primaryColorDark: textTheme.secondaryTextColor,
        canvasColor: colors.scaffoldBackgroundColor,
        dividerColor: AppColors.lightGrey,
        highlightColor: colors.highlightColor,
        splashColor: AppColors.lightGrey,
        disabledColor: colors.disabledColor,
        dialogBackgroundColor: colors.colorScheme.primary.withOpacity(.8),
        indicatorColor: colors.colorScheme.secondary,
        hintColor: textTheme.secondaryTextColor,
        errorColor: colors.colorScheme.error,
        toggleableActiveColor: colors.highlightColor,
        buttonTheme: _buttonTheme,
        inputDecorationTheme: _inputDecoTheme,
      );

  ButtonThemeData get _buttonTheme => ButtonThemeData(
        shape: ShapedBorders.roundedLow,
        disabledColor: colors.disabledColor,
        highlightColor: colors.highlightColor,
        splashColor: colors.dividerColor,
        hoverColor: colors.dividerColor,
        colorScheme: colors.colorScheme,
      );

  InputDecorationTheme get _inputDecoTheme => InputDecorationTheme(
        labelStyle: textTheme.labelStyle,
        helperStyle: textTheme.labelStyle,
        hintStyle: textTheme.hintStyle,
        errorStyle: textTheme.errorStyle,
        enabledBorder: _enabledBorder,
        focusedBorder: _focusedBorder,
        errorBorder: _errorBorder,
        focusedErrorBorder: _focusedBorder,
        disabledBorder: _enabledBorder,
      );

  InputBorder get _enabledBorder => OutlineInputBorder(
        borderSide: BorderSide(color: colors.primaryColorLight),
        borderRadius: BorderRadii.highCircular,
      );

  InputBorder get _focusedBorder => OutlineInputBorder(
        borderSide: BorderSide(color: colors.colorScheme.primary, width: 1.8),
        borderRadius: BorderRadii.extremeCircular,
      );

  InputBorder get _errorBorder => OutlineInputBorder(
        borderSide: BorderSide(color: colors.colorScheme.error, width: 1.8),
        borderRadius: BorderRadii.extremeCircular,
      );
}

class LightAppTheme extends ITheme {
  @override
  IColors get colors => DarkColors();

  @override
  ITextTheme get textTheme => DarkTextTheme();
}

class DarkAppTheme extends ITheme {
  @override
  ITextTheme get textTheme => LightTextTheme();

  @override
  IColors get colors => LightColors();
}
