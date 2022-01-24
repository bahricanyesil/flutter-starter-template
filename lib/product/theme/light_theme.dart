import '../../core/theme/l_theme.dart';
import 'color/light_colors.dart';
import 'text/light_text_theme.dart';

/// Light theme of the app.
class LightTheme extends ITheme {
  /// Default constructor for [LightTheme].
  LightTheme()
      : super(
          colors: LightColors(),
          textTheme: const LightTextTheme(),
        );
}
