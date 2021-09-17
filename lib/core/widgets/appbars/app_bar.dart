import 'package:flutter/material.dart';
import '../../extensions/context/edge-insets/symmetric_edge_insets_extensions.dart';

/// Default App Bar implements [PreferredSizeWidget]
/// with its required functions.
class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    required this.size,
    required this.children,
    Key? key,
  }) : super(key: key);

  /// Height of the app bar.
  final double size;

  /// Widgets will be placed into the app bar.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: Colors.blueAccent,
        flexibleSpace: getMainRow(context),
        automaticallyImplyLeading: false,
      );

  /// Creates the main row of the app bar with given
  /// [children] widgets and suitable padding value.
  Widget getMainRow(BuildContext context) => Padding(
        padding: context.horizontalMedHigh,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          ),
        ),
      );

  /// Overrides the [preferredSize] field with a given height value [size].
  @override
  Size get preferredSize => Size.fromHeight(size);
}
