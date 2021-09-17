import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Orientation get orientation => mediaQuery.orientation;

  double get maxPossibleHeight => mediaQuery.size.height;
  double get maxPossibleWidth => mediaQuery.size.width;

  EdgeInsets get mediaPadding => mediaQuery.padding;
  double get mediaTopPad => mediaPadding.top;
  double get mediaBottomPad => mediaPadding.bottom;

  EdgeInsets get mediaViewInsets => mediaQuery.viewInsets;
  double get viewTopPad => mediaViewInsets.top;
  double get viewBottomPad => mediaViewInsets.bottom;

  double get height => mediaQuery.size.height * 0.01;
  double get width => mediaQuery.size.width * 0.01;

  double get lowHeight => height * 1.5;
  double get lowWidth => width * 1.5;

  double get lowMedHeight => height * 2;
  double get lowMedWidth => width * 2;

  double get medHeight => height * 2.8;
  double get medWidth => width * 2.8;

  double get medHighHeight => height * 5;
  double get medHighWidth => width * 5;

  double get highHeight => height * 8;
  double get highWidth => width * 8;

  double get extremeHeight => height * 10;
  double get extremeWidth => width * 10;

  double get maxHeight => height * 20;
  double get maxWidth => width * 20;
}
