import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import '../../../constants/border/shape_borders.dart';
import '../../../constants/duration/durations.dart';
import '../../../extensions/context/context_extensions_shelf.dart';
import '../../texts/base_text.dart';
import 'platform_sensitive_dialog.dart';

class CustomDialog extends PlatformSensitiveWidget {
  const CustomDialog({
    required this.content,
    this.title,
    this.rightButtonText = 'OK',
    this.action,
    this.leftButtonText,
    this.leftButtonAction,
    this.rightButtonTextColor,
    this.leftButtonTextColor,
    this.rightButtonColor,
    this.leftButtonColor,
    this.willPop = true,
    Key? key,
  }) : super(key: key);

  final Widget content;
  final String? title;
  final String rightButtonText;
  final String? leftButtonText;
  final Function()? action;
  final Function()? leftButtonAction;
  final Color? leftButtonTextColor;
  final Color? rightButtonTextColor;
  final Color? rightButtonColor;
  final Color? leftButtonColor;
  final bool willPop;

  Future<void> show(BuildContext context) async => showModal(
        configuration: const FadeScaleTransitionConfiguration(
          transitionDuration: Durations.fast,
        ),
        context: context,
        builder: (BuildContext context) => this,
      );

  @override
  Widget androidDialog(BuildContext context) => _androidWebDialog();

  @override
  Widget webDialog(BuildContext context) => _androidWebDialog();

  @override
  Widget iosDialog(BuildContext context) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            CupertinoAlertDialog(
          title: _getTitle(context),
          content: content,
          actions: _setDialogButton(context),
        ),
      );

  Widget _getTitle(BuildContext context) => title == null
      ? Container()
      : BaseText(
          title!,
          textStyle: context.headline4.copyWith(color: context.primaryColor),
        );

  Widget _androidWebDialog() => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            AlertDialog(
          shape: ShapedBorders.roundedMedium,
          elevation: 3,
          backgroundColor: context.canvasColor,
          title: _getTitle(context),
          content: content,
          actions: _setDialogButton(context),
        ),
      );

  List<Widget> _setDialogButton(BuildContext context) {
    if (kIsWeb) {
      return _getButtons(context, isIOS: false);
    } else if (Platform.isIOS) {
      return _getButtons(context, isIOS: true);
    } else {
      return _getButtons(context, isIOS: false);
    }
  }

  List<Widget> _getButtons(BuildContext context, {required bool isIOS}) =>
      <Widget>[
        if (leftButtonText != null)
          _getLeftButton(context, text: leftButtonText!, isIOS: isIOS),
        _getRightButton(context, isIOS: isIOS),
      ];

  Widget _getLeftButton(BuildContext context,
          {required String text, required bool isIOS}) =>
      Padding(
        padding: getButtonPadding(context).copyWith(right: 0),
        child: isIOS
            ? CupertinoDialogAction(
                onPressed:
                    leftButtonAction ?? () => Navigator.of(context).pop(),
                child: _buttonText(text, context),
              )
            : TextButton(
                onPressed:
                    leftButtonAction ?? () => Navigator.of(context).pop(),
                child: _buttonText(text, context),
              ),
      );

  Widget _getRightButton(BuildContext context, {required bool isIOS}) =>
      Padding(
        padding: getButtonPadding(context),
        child: isIOS
            ? CupertinoDialogAction(
                onPressed: () async => _rightButtonAction(context),
                child: _buttonText(rightButtonText, context),
              )
            : TextButton(
                onPressed: () async => _rightButtonAction(context),
                child: _buttonText(rightButtonText, context),
              ),
      );

  Future<void> _rightButtonAction(BuildContext context) async {
    if (willPop) Navigator.of(context).pop();
    if (action != null) await action!();
  }

  Widget _buttonText(String text, BuildContext context) => BaseText(
        text,
        textStyle: context.headline5
            .copyWith(color: leftButtonTextColor ?? context.primaryColor),
      );

  EdgeInsets getButtonPadding(BuildContext context) =>
      EdgeInsets.only(right: context.width * .3, bottom: context.height * .5);
}
