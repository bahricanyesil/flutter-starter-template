import 'package:flutter/material.dart';
import 'package:template/core/decoration/boxes/box_decorations.dart';

import '../../constants/border/border_radii.dart';
import '../../decoration/texts/text_form_styles.dart';
import '../../extensions/context/context_extensions_shelf.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final EdgeInsets? padding;
  final String? hintText;
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final double widthFactor;
  const CustomTextFormField({
    required this.controller,
    this.padding,
    this.hintText,
    this.prefixIcon,
    this.backgroundColor,
    this.widthFactor = 40,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        elevation: 3,
        color: backgroundColor,
        shadowColor: context.primaryDarkColor,
        borderRadius: BorderRadii.mediumCircular,
        child: Container(
          width: context.width * widthFactor,
          padding: padding ?? EdgeInsets.zero,
          child: _getTextFormField(context, backgroundColor),
        ),
      );

  Widget _getTextFormField(BuildContext context, Color? backgroundColor) =>
      TextFormField(
        controller: controller,
        style: context.headline5.copyWith(color: Colors.black87),
        // decoration: _getFormDeco(context),
      );

  InputDecoration _getFormDeco(BuildContext context) =>
      TextFormDeco(context).loginDeco(
        hintText: hintText,
        prefixIcon: prefixIcon,
        backgroundColor: backgroundColor,
      );
}
