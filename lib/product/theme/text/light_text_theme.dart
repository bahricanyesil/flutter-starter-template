import '../../../core/theme/color/l_colors.dart';
import '../../../core/theme/text/l_text_theme.dart';

/// Text themes to use in the dark mode.
class LightTextTheme extends ITextTheme {
  /// Default [LightTextTheme] constructor.
  const LightTextTheme()
      : super(
          primaryTextColor: AppColors.black,
          secondaryTextColor: AppColors.black,
        );
}
