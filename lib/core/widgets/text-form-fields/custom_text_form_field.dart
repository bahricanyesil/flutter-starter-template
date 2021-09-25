import 'package:flutter/material.dart';

import '../../constants/border/border_radii.dart';
import '../../decoration/texts/text_form_styles.dart';
import '../../extensions/context/context_extensions_shelf.dart';
import '../icon-buttons/base_icon_button.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final EdgeInsets? padding;
  final String? hintText;
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final bool isObscured;
  final bool expands;
  final double widthFactor;
  const CustomTextField({
    required this.controller,
    this.padding,
    this.hintText,
    this.prefixIcon,
    this.backgroundColor,
    this.isObscured = false,
    this.expands = true,
    this.widthFactor = 40,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: context.width * widthFactor,
        padding: padding ?? EdgeInsets.zero,
        child: Material(
          elevation: 3,
          color: backgroundColor,
          shadowColor: context.primaryDarkColor,
          borderRadius: BorderRadii.mediumCircular,
          child: _getTextFormField(context, backgroundColor),
        ),
      );

  Widget _getTextFormField(BuildContext context, Color? backgroundColor) {
    bool isVisible = !isObscured;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) => TextFormField(
          controller: controller,
          style: context.headline5.copyWith(color: Colors.black87),
          maxLines: expands && isVisible || !isObscured ? null : 1,
          obscureText: !isVisible && isObscured,
          decoration: _getFormDeco(context, isVisible,
              () => setState(() => isVisible = !isVisible))),
    );
  }

  InputDecoration _getFormDeco(
          BuildContext context, bool isVisible, Function() onPressed) =>
      TextFormDeco(context)
          .loginDeco(
            hintText: hintText,
            prefixIcon: prefixIcon,
            backgroundColor: backgroundColor,
          )
          .copyWith(suffixIcon: _getSuffixIcon(isVisible, onPressed, context));

  Widget _getSuffixIcon(
          bool isVisible, Function() onPressed, BuildContext context) =>
      SizedBox(
        width: context.width * (widthFactor / 6),
        child: BaseIconButton(
          icon: isVisible
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          onPressed: onPressed,
          isVisible: isObscured,
        ),
      );
}
