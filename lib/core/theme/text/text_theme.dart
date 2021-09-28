import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../color/color_manager.dart';

abstract class ITextTheme {
  final Color primaryTextColor;
  final Color secondaryTextColor;
  const ITextTheme({
    required this.primaryTextColor,
    required this.secondaryTextColor,
  });

  String get fontFamily => GoogleFonts.poppins().fontFamily ?? 'Poppins';

  TextTheme get data => TextTheme(
        bodyText1: bodyText1,
        bodyText2: bodyText2,
        headline1: headline1,
        headline2: headline2,
        headline3: headline3,
        headline4: headline4,
        headline5: headline5,
        headline6: headline6,
        subtitle1: subtitle1,
        subtitle2: subtitle2,
      );

  TextStyle get labelStyle => headline5;

  TextStyle get hintStyle => headline5.copyWith(color: secondaryTextColor);

  TextStyle get errorStyle => headline5.copyWith(color: AppColors.error);

  TextStyle get bodyText1 => _textStyle(17);

  TextStyle get bodyText2 => _textStyle(15);

  TextStyle get headline1 =>
      _textStyle(25, fontWeight: FontWeight.w700, letterSpacing: 1.4);

  TextStyle get headline2 =>
      _textStyle(22, fontWeight: FontWeight.w600, letterSpacing: 1.3);

  TextStyle get headline3 =>
      _textStyle(20, fontWeight: FontWeight.w500, letterSpacing: 1.2);

  TextStyle get headline4 => _textStyle(18);

  TextStyle get headline5 => _textStyle(16);

  TextStyle get headline6 =>
      _textStyle(14, customTextColor: secondaryTextColor);

  TextStyle get subtitle1 =>
      _textStyle(12, customTextColor: secondaryTextColor);

  TextStyle get subtitle2 => _textStyle(10,
      fontWeight: FontWeight.w300,
      letterSpacing: .8,
      customTextColor: secondaryTextColor);

  TextStyle _textStyle(
    double fontSize, {
    double? letterSpacing,
    FontWeight? fontWeight,
    Color? customTextColor,
    String? customFontFamily,
  }) =>
      TextStyle(
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        color: customTextColor ?? primaryTextColor,
        fontFamily: customFontFamily ?? fontFamily,
      );
}
