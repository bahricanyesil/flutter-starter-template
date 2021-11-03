part of '../color_manager.dart';

class LightColors implements IColors {
  @override
  ColorScheme get colorScheme => ColorScheme.fromSwatch(
      // TODO(bahrican):
      );

  @override
  Color get appBarColor => AppColors.white;

  @override
  Color get scaffoldBackgroundColor => AppColors.white;

  @override
  Color get tabBarColor => AppColors.green;

  @override
  Color get tabbarNormalColor => AppColors.darkerGrey;

  @override
  Color get tabbarSelectedColor => AppColors.green;

  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get disabledColor => AppColors.darkGrey;

  @override
  Color get highlightColor => AppColors.secondaryLight;

  @override
  Color get dividerColor => AppColors.lightGrey;

  @override
  Color get primaryColorLight => const Color(0xff616161);

  @override
  Color get primaryColorDark => const Color(0xffBDBDBD);
}
