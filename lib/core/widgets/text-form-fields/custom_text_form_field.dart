import 'package:flutter/material.dart';

import '../../decoration/input/input_decorations.dart';
import '../../extensions/context/context_extensions_shelf.dart';
import '../../helpers/device-type/device_type_helper.dart';
import 'base_text_form_field_wrapper.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final EdgeInsets? padding;
  final String? hintText;
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final double? widthFactor;
  final double? heightFactor;
  const CustomTextFormField({
    required this.controller,
    this.padding,
    this.hintText,
    this.prefixIcon,
    this.backgroundColor,
    this.widthFactor,
    this.heightFactor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseTextFormFieldWrapper(
        formField: TextFormField(
          controller: controller,
          style: _textStyle(context),
          decoration: _getFormDeco(context),
          expands: true,
          maxLines: null,
        ),
        backgroundColor: backgroundColor,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        padding: padding,
      );

  InputDecoration _getFormDeco(BuildContext context) =>
      InputDeco(context).loginDeco(
        hintText: hintText,
        prefixIcon: prefixIcon,
        backgroundColor: backgroundColor,
      );

  TextStyle _textStyle(BuildContext context) =>
      (DeviceTypeHelper(context).isLandscape
              ? context.headline4
              : context.bodyText2)
          .copyWith(color: Colors.black87);
}
