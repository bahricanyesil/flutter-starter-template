import 'package:flutter/material.dart';
import '../../constants/border/border_radii.dart';
import '../../extensions/context/responsiveness_extension.dart';
import '../../extensions/context/theme_extension.dart';

class BaseTextFormFieldWrapper extends StatelessWidget {
  final TextFormField formField;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final double? widthFactor;
  final double? heightFactor;
  const BaseTextFormFieldWrapper({
    required this.formField,
    this.padding,
    this.backgroundColor,
    this.widthFactor,
    this.heightFactor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Theme(
        data: context.theme.copyWith(brightness: Brightness.light),
        child: Material(
          elevation: 3,
          color: backgroundColor ?? context.canvasColor,
          shadowColor: context.primaryDarkColor,
          borderRadius: BorderRadii.mediumCircular,
          child: Container(
            width: context.width * (widthFactor ?? 35),
            height: context.height * (heightFactor ?? 10),
            padding: padding ?? EdgeInsets.zero,
            child: formField,
          ),
        ),
      );
}
