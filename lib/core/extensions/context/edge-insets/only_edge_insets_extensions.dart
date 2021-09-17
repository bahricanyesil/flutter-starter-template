import 'package:flutter/material.dart';
import '../responsiveness_extension.dart';

extension LeftEdgeInsetsExtension on BuildContext {
  EdgeInsets get leftLow => EdgeInsets.only(left: lowWidth);
  EdgeInsets get leftLowMed => EdgeInsets.only(left: lowMedWidth);
  EdgeInsets get leftMed => EdgeInsets.only(left: medWidth);
  EdgeInsets get leftMedHigh => EdgeInsets.only(left: medHighWidth);
  EdgeInsets get leftHigh => EdgeInsets.only(left: highWidth);
  EdgeInsets get leftExtreme => EdgeInsets.only(left: extremeWidth);
}

extension RightEdgeInsetsExtension on BuildContext {
  EdgeInsets get rightLow => EdgeInsets.only(right: lowWidth);
  EdgeInsets get rightLowMed => EdgeInsets.only(right: lowMedWidth);
  EdgeInsets get rightMed => EdgeInsets.only(right: medWidth);
  EdgeInsets get rightMedHigh => EdgeInsets.only(right: medHighWidth);
  EdgeInsets get rightHigh => EdgeInsets.only(right: highWidth);
  EdgeInsets get rightExtreme => EdgeInsets.only(right: extremeWidth);
}

extension TopEdgeInsetsExtension on BuildContext {
  EdgeInsets get topLow => EdgeInsets.only(top: lowHeight);
  EdgeInsets get topLowMed => EdgeInsets.only(top: lowMedHeight);
  EdgeInsets get topMed => EdgeInsets.only(top: medHeight);
  EdgeInsets get topMedHigh => EdgeInsets.only(top: medHighHeight);
  EdgeInsets get topHigh => EdgeInsets.only(top: highHeight);
  EdgeInsets get topExtreme => EdgeInsets.only(top: extremeHeight);
}

extension BottomEdgeInsetsExtension on BuildContext {
  EdgeInsets get bottomLow => EdgeInsets.only(bottom: lowHeight);
  EdgeInsets get bottomLowMed => EdgeInsets.only(bottom: lowMedHeight);
  EdgeInsets get bottomMed => EdgeInsets.only(bottom: medHeight);
  EdgeInsets get bottomMedHigh => EdgeInsets.only(bottom: medHighHeight);
  EdgeInsets get bottomHigh => EdgeInsets.only(bottom: highHeight);
  EdgeInsets get bottomExtreme => EdgeInsets.only(bottom: extremeHeight);
}
