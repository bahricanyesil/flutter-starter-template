import 'package:flutter/material.dart';
import '../responsiveness_extension.dart';

extension VerticalEdgeInsetsExtension on BuildContext {
  EdgeInsets get verticalLow => EdgeInsets.symmetric(vertical: lowHeight);
  EdgeInsets get verticalLowMed => EdgeInsets.symmetric(vertical: lowMedHeight);
  EdgeInsets get verticalMed => EdgeInsets.symmetric(vertical: medHeight);
  EdgeInsets get verticalMedHigh =>
      EdgeInsets.symmetric(vertical: medHighHeight);
  EdgeInsets get verticalHigh => EdgeInsets.symmetric(vertical: highHeight);
  EdgeInsets get verticalExtreme =>
      EdgeInsets.symmetric(vertical: extremeHeight);
  EdgeInsets get verticalMax => EdgeInsets.symmetric(vertical: maxHeight);
}

extension HorizontalEdgeInsetsExtension on BuildContext {
  EdgeInsets get horizontalExtremeLow =>
      EdgeInsets.symmetric(horizontal: extremeLowWidth);
  EdgeInsets get horizontalLow => EdgeInsets.symmetric(horizontal: lowWidth);
  EdgeInsets get horizontalLowMed =>
      EdgeInsets.symmetric(horizontal: lowMedWidth);
  EdgeInsets get horizontalMed => EdgeInsets.symmetric(horizontal: medWidth);
  EdgeInsets get horizontalMedHigh =>
      EdgeInsets.symmetric(horizontal: medHighWidth);
  EdgeInsets get horizontalHigh => EdgeInsets.symmetric(horizontal: highWidth);
  EdgeInsets get horizontalExtreme =>
      EdgeInsets.symmetric(horizontal: extremeWidth);
  EdgeInsets get horizontalMax => EdgeInsets.symmetric(horizontal: maxWidth);
}

extension SymmetricEdgeInsetsExtension on BuildContext {
  EdgeInsets get lowSymmetric =>
      EdgeInsets.symmetric(horizontal: lowWidth, vertical: lowHeight);
  EdgeInsets get lowMedSymmetric =>
      EdgeInsets.symmetric(horizontal: lowMedWidth, vertical: lowMedHeight);
  EdgeInsets get medSymmetric =>
      EdgeInsets.symmetric(horizontal: medWidth, vertical: medHeight);
  EdgeInsets get medHighSymmetric =>
      EdgeInsets.symmetric(horizontal: medWidth, vertical: medHighHeight);
  EdgeInsets get highSymmetric =>
      EdgeInsets.symmetric(horizontal: highWidth, vertical: highHeight);
  EdgeInsets get extremeSymmetric =>
      EdgeInsets.symmetric(horizontal: extremeWidth, vertical: extremeHeight);
}
