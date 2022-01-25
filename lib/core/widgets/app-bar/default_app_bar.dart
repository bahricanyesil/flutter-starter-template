import 'package:flutter/material.dart';

import '../../constants/enums/view-enums/sizes.dart';
import '../../extensions/context/responsiveness_extensions.dart';
import '../../extensions/context/theme_extensions.dart';
import '../../managers/navigation/navigation_manager.dart';
import '../../theme/color/l_colors.dart';
import '../buttons/default_icon_button.dart';
import '../icons/base_icon.dart';
import '../text/base_text.dart';

/// Default App Bar extends [AppBar]
/// with its required functions.
class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Default app bar constructor.
  const DefaultAppBar({
    this.size,
    this.color,
    this.actionsList = const <Widget>[],
    this.titleIcon,
    this.titleText,
    this.showBack = false,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  /// Size of the app bar.
  final double? size;

  /// Background color of the app bar.
  final Color? color;

  /// List of actions on the app bar.
  final List<Widget> actionsList;

  /// Icon of the title.
  final IconData? titleIcon;

  /// Text of the title.
  final String? titleText;

  /// Indicates whether to show a return back icon at top left.
  final bool showBack;

  /// Style of the title text.
  final TextStyle? textStyle;

  Widget _titleTextWidget(BuildContext context) => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: context.horizontalPadding(Sizes.extremeLow),
          child:
              BaseText(titleText!, fontSizeFactor: 6.5, color: AppColors.white),
        ),
      );

  Widget _backButton(BuildContext context) => FittedBox(
        fit: BoxFit.scaleDown,
        child: DefaultIconButton(
          onPressed: () => NavigationManager.instance.popRoute(),
          icon: Icons.chevron_left_outlined,
          color: AppColors.white,
        ),
      );

  @override
  Size get preferredSize => Size.fromHeight(size ?? 100);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Container(
          color: context.primaryColor,
          padding: context.horizontalPadding(Sizes.med),
          child: Row(
            children: <Widget>[
              if (showBack) _backButton(context),
              if (titleIcon != null)
                BaseIcon(titleIcon!, sizeFactor: 6.5, color: AppColors.white),
              SizedBox(width: context.responsiveSize * 2),
              if (titleText != null) Expanded(child: _titleTextWidget(context)),
              ...actionsList,
            ],
          ),
        ),
      );

  /// Copies the given [DefaultAppBar] with the one we have.
  DefaultAppBar copyWithSize(double newSize) => DefaultAppBar(
        color: color,
        actionsList: actionsList,
        size: newSize,
        titleIcon: titleIcon,
        titleText: titleText,
        showBack: showBack,
        textStyle: textStyle,
      );
}
