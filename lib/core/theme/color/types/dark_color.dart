part of '../color_manager.dart';

class DarkColors implements IColors {
  @override
  ColorScheme get colorScheme => ColorScheme.fromSwatch(
      // TODO(bahrican): Fill here
      );

  @override
  Color get appBarColor => AppColors.darkGrey;

  @override
  Color get scaffoldBackgroundColor => AppColors.white;

  @override
  Color get tabBarColor => AppColors.green;

  @override
  Color get tabbarNormalColor => AppColors.lighterGrey;

  @override
  Color get tabbarSelectedColor => AppColors.green;

  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get disabledColor => AppColors.darkGrey;

  @override
  Color get highlightColor => AppColors.secondaryDark;

  @override
  Color get dividerColor => AppColors.lightGrey;

  @override
  Color get primaryColorLight => const Color(0xffBDBDBD);

  @override
  Color get primaryColorDark => const Color(0xff616161);
}
