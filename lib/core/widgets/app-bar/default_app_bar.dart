import 'package:flutter/material.dart';

import '../../managers/navigation/navigation_manager.dart';
import '../icons/base_icon.dart';
import '../text/base_text.dart';

/// Default App Bar extends [AppBar]
/// with its required functions.
class DefaultAppBar extends AppBar implements PreferredSizeWidget {
  /// Default app bar constructor.
  DefaultAppBar({
    this.size,
    this.color,
    this.actionsList,
    this.titleIcon,
    this.titleText,
    this.showBack = false,
    this.textStyle,
    Key? key,
  }) : super(
          backgroundColor: color,
          automaticallyImplyLeading: false,
          centerTitle: false,
          actions: _actions(actionsList),
          title: _title(titleIcon, titleText, showBack, textStyle),
          titleSpacing: _horizontalPadding,
          key: key,
        );

  /// Overrides the [preferredSize] field with a given height value [size].
  @override
  Size get preferredSize => Size.fromHeight(size ?? 100);

  /// Size of the app bar.
  final double? size;

  /// Background color of the app bar.
  final Color? color;

  /// List of actions on the app bar.
  final List<Widget>? actionsList;

  /// Icon of the title.
  final IconData? titleIcon;

  /// Text of the title.
  final String? titleText;

  /// Indicates whether to show a return back icon at top left.
  final bool showBack;

  /// Style of the title text.
  final TextStyle? textStyle;

  static Widget _title(IconData? titleIcon, String? titleText,
          bool showBackIcon, TextStyle? textStyle) =>
      Row(
        children: <Widget>[
          if (showBackIcon) Expanded(child: _backButton),
          if (titleIcon != null) Expanded(child: SizedBaseIcon(titleIcon)),
          if (titleText != null)
            Expanded(flex: 9, child: _titleTextWidget(titleText, textStyle))
        ],
      );

  static Widget _titleTextWidget(String titleText, TextStyle? textStyle) =>
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BaseText(titleText, fontSizeFactor: 7, style: textStyle),
        ),
      );

  static IconButton get _backButton => IconButton(
        icon: const BaseIcon(Icons.chevron_left_outlined, sizeFactor: 7.5),
        splashRadius: 20,
        padding: EdgeInsets.zero,
        onPressed: () => NavigationManager.instance.popRoute(),
      );

  static const double _horizontalPadding = 12;

  static List<Widget>? _actions(List<Widget>? actionsList) => actionsList ==
          null
      ? null
      : <Widget>[
          FittedBox(fit: BoxFit.scaleDown, child: Row(children: actionsList)),
          const SizedBox(width: _horizontalPadding)
        ];

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
