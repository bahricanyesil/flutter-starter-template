import 'package:flutter/material.dart';

import '../../constants/border/border_radii.dart';
import '../../decoration/texts/text_form_styles.dart';
import '../../extensions/context/context_extensions_shelf.dart';
import '../icon-buttons/base_icon_button.dart';

class ObscuredTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final EdgeInsets? padding;
  final String? hintText;
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final double widthFactor;
  const ObscuredTextFormField({
    required this.controller,
    this.padding,
    this.hintText,
    this.prefixIcon,
    this.backgroundColor,
    this.widthFactor = 40,
    Key? key,
  }) : super(key: key);

  @override
  _ObscuredTextFormFieldState createState() => _ObscuredTextFormFieldState();
}

class _ObscuredTextFormFieldState extends State<ObscuredTextFormField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) => Material(
        elevation: 3,
        color: widget.backgroundColor,
        shadowColor: context.primaryDarkColor,
        borderRadius: BorderRadii.mediumCircular,
        child: Container(
          width: context.width * widget.widthFactor,
          padding: widget.padding ?? EdgeInsets.zero,
          child: _getTextFormField(),
        ),
      );

  Widget _getTextFormField() => TextFormField(
        controller: widget.controller,
        style: context.headline5.copyWith(color: Colors.black87),
        obscureText: !_isVisible,
        decoration: _getFormDeco(),
      );

  InputDecoration _getFormDeco() => TextFormDeco(context)
      .loginDeco(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        backgroundColor: widget.backgroundColor,
      )
      .copyWith(suffixIcon: _getSuffixIcon());

  Widget _getSuffixIcon() => SizedBox(
        width: context.width * (widget.widthFactor / 6),
        child: BaseIconButton(
          icon: _isVisible
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          onPressed: _changeVisibility,
        ),
      );

  void _changeVisibility() => setState(() => _isVisible = !_isVisible);
}
