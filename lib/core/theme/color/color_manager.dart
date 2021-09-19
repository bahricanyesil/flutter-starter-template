import 'dart:ui';

import 'package:flutter/material.dart';

part './types/light_color.dart';
part './types/dark_color.dart';

abstract class IColors {
  final Color scaffoldBackgroundColor;
  final Color appBarColor;
  final Color tabBarColor;
  final Color tabbarSelectedColor;
  final Color tabbarNormalColor;
  final Color disabledColor;
  final Color highlightColor;
  final Color dividerColor;
  final Color primaryColorLight;
  final Color primaryColorDark;

  final Brightness brightness;
  final ColorScheme colorScheme;

  const IColors({
    required this.scaffoldBackgroundColor,
    required this.appBarColor,
    required this.tabBarColor,
    required this.tabbarSelectedColor,
    required this.tabbarNormalColor,
    required this.disabledColor,
    required this.highlightColor,
    required this.dividerColor,
    required this.primaryColorLight,
    required this.primaryColorDark,
    required this.brightness,
    required this.colorScheme,
  });
}

@immutable
class AppColors {
  static const Color primaryLight = Color(0xff6666FF);
  static const Color secondaryLight = Color(0xffFFDF4D);
  static const Color primaryDark = Color(0xff6666FF);
  static const Color secondaryDark = Color(0xffFFDF4D);
  static const Color white = Color(0xffffffff);
  static const Color green = Color(0xff7bed8d);
  static const Color mediumGrey = Color(0xffa6bcd0);
  static const Color mediumGreyBold = Color(0xff748a9d);
  static const Color lighterGrey = Color(0xfff0f4f8);
  static const Color lightGrey = Color(0xffdbe2ed);
  static const Color darkerGrey = Color(0xff404e5a);
  static const Color darkGrey = Color(0xff4e5d6a);
  static const Color error = Color(0xffff3333);
}
