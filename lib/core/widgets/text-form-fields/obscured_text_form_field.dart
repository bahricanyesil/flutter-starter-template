import 'package:flutter/material.dart';

import '../../decoration/input/input_decorations.dart';
import '../../extensions/context/context_extensions_shelf.dart';
import '../../helpers/device-type/device_type_helper.dart';
import '../icon-buttons/base_icon_button.dart';
import 'base_text_form_field_wrapper.dart';

class ObscuredTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final EdgeInsets? padding;
  final String? hintText;
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final double widthFactor;
  final double heightFactor;
  const ObscuredTextFormField({
    required this.controller,
    this.padding,
    this.hintText,
    this.prefixIcon,
    this.backgroundColor,
    this.widthFactor = 35,
    this.heightFactor = 10,
    Key? key,
  }) : super(key: key);

  @override
  _ObscuredTextFormFieldState createState() => _ObscuredTextFormFieldState();
}

class _ObscuredTextFormFieldState extends State<ObscuredTextFormField> {
  bool _isVisible = false;
  late final bool isLandscape = DeviceTypeHelper(context).isLandscape;

  @override
  Widget build(BuildContext context) => BaseTextFormFieldWrapper(
        formField: TextFormField(
          controller: widget.controller,
          style: _textStyle(context),
          obscureText: !_isVisible,
          decoration: _formDeco,
        ),
        backgroundColor: widget.backgroundColor,
        heightFactor: widget.heightFactor,
        widthFactor: widget.widthFactor,
        padding: widget.padding,
      );

  InputDecoration get _formDeco => InputDeco(context)
      .loginDeco(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        backgroundColor: widget.backgroundColor,
        paddingFactor: 2.5,
      )
      .copyWith(suffixIcon: _suffixIcon);

  Widget get _suffixIcon => BaseIconButton(
        icon: _isVisible
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
        onPressed: _changeVisibility,
        size: context.width * _suffixWidthFactor,
      );

  double get _suffixWidthFactor => widget.widthFactor / (isLandscape ? 4 : 6);

  TextStyle _textStyle(BuildContext context) =>
      (isLandscape ? context.headline4 : context.bodyText2)
          .copyWith(color: Colors.black87);

  void _changeVisibility() => setState(() => _isVisible = !_isVisible);
}
