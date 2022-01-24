import 'package:flutter/material.dart';

import '../../decoration/text_styles.dart';
import '../../extensions/color/color_extensions.dart';
import '../../extensions/context/responsiveness_extensions.dart';
import '../../extensions/context/theme_extensions.dart';
import '../../helpers/material_state_helper.dart';
import '../../theme/color/l_colors.dart';
import '../text/base_text.dart';

/// Callback of the checkbox.
typedef CheckboxCallback = void Function(bool);

/// Customized [Checkbox] with a leading text.
class CustomCheckboxTile extends StatefulWidget {
  /// Default constructor for [CheckboxListTile].
  const CustomCheckboxTile({
    required this.onTap,
    required this.text,
    this.initialValue = false,
    this.forcedValue,
    Key? key,
  }) : super(key: key);

  /// Initial value of the checkbox.
  final bool initialValue;

  /// Forced value of the checkbox.
  final bool? forcedValue;

  /// Callback to call on checkbox click.
  final CheckboxCallback onTap;

  /// Text will be shown beside of the checkbox.
  final String text;

  @override
  State<CustomCheckboxTile> createState() => _CustomCheckboxTileState();
}

class _CustomCheckboxTileState extends State<CustomCheckboxTile>
    with MaterialStateHelper {
  late bool value = widget.initialValue;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => _changeValue(!value),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[_checkbox, _expanded],
        ),
      );

  Widget get _checkbox => ConstrainedBox(
        constraints:
            BoxConstraints.loose(Size.fromHeight(context.height * 4.5)),
        child: Checkbox(
          value: widget.forcedValue ?? value,
          overlayColor: all<Color>(context.primaryLightColor),
          fillColor: all<Color?>((widget.forcedValue ?? value)
              ? context.primaryColor
              : AppColors.white.darken()),
          splashRadius: 17,
          onChanged: (bool? newValue) {
            if (newValue != null) _changeValue(newValue);
          },
        ),
      );

  Widget get _expanded {
    final bool selected = widget.forcedValue ?? value;
    return BaseText(
      widget.text,
      textAlign: TextAlign.left,
      style: TextStyles(context).subBodyStyle(
        color: selected ? context.primaryColor : null,
        fontWeight: selected ? FontWeight.w600 : null,
        fontSizeFactor: selected ? 5.1 : null,
      ),
    );
  }

  void _changeValue(bool newValue) {
    widget.onTap(newValue);
    setState(() => value = newValue);
  }
}
