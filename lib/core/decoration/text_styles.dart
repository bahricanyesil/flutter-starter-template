import 'package:flutter/material.dart';

import '../extensions/context/responsiveness_extensions.dart';
import '../providers/providers_shelf.dart';
import '../theme/color/l_colors.dart';

/// [TextStyles] class collects all customized [TextStyle] in one file.
class TextStyles {
  /// Default constructor for the [TextStyles].
  TextStyles(BuildContext context)
      : _context = context,
        _isDark = context.watch<ThemeProvider>().isDark;

  /// Context for the stylings.
  final BuildContext _context;

  final bool _isDark;

  /// Custom text style for titles in the login screen.
  /// Such as: "welcome", "loginFormTitle" and so on.
  TextStyle titleStyle({Color? color, TextDecoration? decoration}) => TextStyle(
        fontSize: _context.responsiveSize * 6.6,
        color: color ?? Theme.of(_context).primaryColor,
        fontWeight: FontWeight.bold,
        wordSpacing: 3.5,
        letterSpacing: 1.3,
        decoration: decoration,
      );

  /// Custom text style for body texts in the login screen.
  /// Such as: "welcomeDescription", "RoundedButton" action text and so on.
  TextStyle bodyStyle({Color? color, FontWeight? fontWeight, double? height}) =>
      TextStyle(
        fontSize: _context.responsiveSize * 5.6,
        color: color ?? _color,
        fontWeight: fontWeight ?? FontWeight.w400,
        wordSpacing: 1.3,
        letterSpacing: .4,
        height: height,
      );

  /// Custom text style for subbody texts in the login screen.
  /// Such as: "forgotPassword" text. Default font size factor is 4.8.
  TextStyle subBodyStyle({
    Color? color,
    TextDecoration? decoration,
    double? height,
    FontWeight? fontWeight,
    double? fontSizeFactor,
  }) =>
      TextStyle(
        fontSize: _context.responsiveSize * (fontSizeFactor ?? 4.8),
        color: color ?? _color,
        fontWeight: fontWeight ?? FontWeight.w400,
        wordSpacing: 1.2,
        letterSpacing: .3,
        decoration: decoration,
        height: height,
      );

  /// Custom text style for normal/regular texts in the login screen.
  /// Such as: "BaseText"/"NotFittedText" texts and so on.
  TextStyle normalStyle(
          {Color? color, double? fontSizeFactor, FontWeight? fontWeight}) =>
      TextStyle(
        fontSize: _context.responsiveSize * (fontSizeFactor ?? 6),
        color: color ?? _color,
        fontWeight: fontWeight ?? FontWeight.w500,
        wordSpacing: 1.7,
        letterSpacing: .7,
      );

  /// Custom text style for text form field texts.
  /// Such as: "CustomTextFormField"/"ObscuredTextFormFields" texts.
  TextStyle textFormStyle({Color? color}) => TextStyle(
        fontSize: _context.responsiveSize * 6,
        color: color ?? Theme.of(_context).primaryColor,
        fontWeight: FontWeight.w400,
        wordSpacing: 1.1,
        letterSpacing: .7,
      );

  /// Custom text style for text form field hint/label texts.
  /// Such as: "CustomTextFormField"/"ObscuredTextFormFields" hint texts.
  TextStyle hintTextStyle({Color? color}) => TextStyle(
        fontSize: _context.responsiveSize * 5.8,
        color: color,
        fontWeight: FontWeight.w400,
        wordSpacing: 1.1,
        letterSpacing: .7,
      );

  /// Custom text style for text form field error texts.
  /// Such as: "CustomTextFormField"/"ObscuredTextFormFields" error texts.
  TextStyle errorTextStyle({Color? color}) => TextStyle(
        fontSize: _context.responsiveSize * 4,
        color: color ?? Colors.red[400],
        wordSpacing: 1.5,
        height: .9,
      );

  /// Custom text style for subtitle/comparably smaller texts.
  /// Such as: "useEmailText"/"notHaveAnAccount" texts.
  TextStyle subtitleTextStyle({
    Color? color,
    double? fontSizeFactor,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    double? height,
  }) =>
      TextStyle(
        fontSize: _context.responsiveSize * (fontSizeFactor ?? 3.4),
        color: color ?? _color,
        fontWeight: fontWeight ?? FontWeight.w400,
        decoration: decoration,
        letterSpacing: .2,
        wordSpacing: .6,
        height: height,
      );

  /// Custom text style for dialog content.
  TextStyle dialogTextStyle(
          {Color? color, FontWeight? fontWeight, TextDecoration? decoration}) =>
      TextStyle(
        fontSize: _context.responsiveSize * 6,
        color: color ?? _color,
        fontWeight: fontWeight ?? FontWeight.w400,
        letterSpacing: .8,
        wordSpacing: 1.5,
        decoration: decoration,
      );

  Color get _color => _isDark ? AppColors.white : AppColors.black;
}
