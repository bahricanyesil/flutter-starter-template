import 'package:flutter/material.dart';
import '../../decoration/texts/text_form_styles.dart';

import '../../extensions/context/context_extensions_shelf.dart';

class RoundedTextButton extends StatelessWidget {
  const RoundedTextButton({
    required this.onChanged,
    required this.prefixIcon,
    this.hintText = '',
    this.visibility = false,
    this.changeVisibility,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);
  final Function(String) onChanged;
  final String hintText;
  final IconData prefixIcon;
  final bool visibility;
  final Function()? changeVisibility;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) => TextFormField(
        style: TextStyle(fontSize: context.width * 1.8),
        decoration: hintText.contains('password')
            ? passDeco(context)
            : loginDeco(context),
        onChanged: onChanged,
        obscureText: hintText.contains('password') && !visibility,
      );

  InputDecoration passDeco(BuildContext context) => loginDeco(context).copyWith(
        suffixIcon: Padding(
          padding: context.rightMed.copyWith(bottom: context.height * 1.6),
          child: IconButton(
            splashRadius: 20,
            icon: Icon(
              visibility
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: context.primaryDarkColor,
              size: context.height * 4.2,
            ),
            onPressed: changeVisibility ?? () {},
          ),
        ),
      );

  InputDecoration loginDeco(BuildContext context) =>
      TextFormDeco(context).loginDeco(
        hintText: hintText,
        prefixIcon: prefixIcon,
        backgroundColor: backgroundColor,
      );
}
