import 'package:flutter/material.dart';

import '../../extensions/extensions_shelf.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => context.theme;

  double height(double value) => context.height * value;
  double width(double value) => context.width * value;
}
