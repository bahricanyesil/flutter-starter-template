import 'package:flutter/material.dart';

import '../../constants/border/border_radii.dart';
import '../../decoration/texts/text_form_styles.dart';
import '../../extensions/context/context_extensions_shelf.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final Function()? changeVisibility;
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final bool isObscured;
  final bool isVisible;
  final bool expands;
  const CustomTextField({
    required this.controller,
    this.hintText,
    this.changeVisibility,
    this.prefixIcon,
    this.backgroundColor,
    this.isObscured = false,
    this.isVisible = false,
    this.expands = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        elevation: 3,
        color: backgroundColor,
        shadowColor: context.primaryDarkColor,
        borderRadius: BorderRadii.mediumCircular,
        child: getTextFormField(context, backgroundColor),
      );

  Widget getTextFormField(BuildContext context, Color? backgroundColor) =>
      TextFormField(
        controller: controller,
        style: context.headline5.copyWith(color: Colors.black87),
        expands: expands && isVisible || !isObscured,
        maxLines: expands && isVisible || !isObscured ? null : 1,
        obscureText: !isVisible && isObscured,
        decoration: getDeco(context, backgroundColor),
      );

  Widget getSuffixIcon(BuildContext context) => Visibility(
        visible: isObscured,
        child: FittedBox(
          child: Padding(
            padding: context.horizontalLow,
            child: getIconButton(),
          ),
        ),
      );

  Widget getIconButton() => IconButton(
        splashRadius: 20,
        icon: Icon(
          isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        ),
        onPressed: changeVisibility,
      );

  InputDecoration getDeco(BuildContext context, Color? backgroundColor) =>
      TextFormDeco(context)
          .loginDeco(
            hintText: hintText,
            prefixIcon: prefixIcon,
            backgroundColor: backgroundColor,
          )
          .copyWith(suffixIcon: getSuffixIcon(context));
}
