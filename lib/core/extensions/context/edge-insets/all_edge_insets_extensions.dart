import 'package:flutter/material.dart';
import '../responsiveness_extension.dart';

extension AllEdgeInsetsExtension on BuildContext {
  EdgeInsets get lowEdgeInsets => _getAll(lowWidth, lowHeight);
  EdgeInsets get lowMedEdgeInsets => _getAll(lowMedWidth, lowMedHeight);
  EdgeInsets get medEdgeInsets => _getAll(medWidth, medHeight);
  EdgeInsets get medHighEdgeInsets => _getAll(medHighWidth, medHighHeight);
  EdgeInsets get highEdgeInsets => _getAll(highWidth, highHeight);
  EdgeInsets get extremeEdgeInsets => _getAll(extremeWidth, extremeHeight);
}

EdgeInsets _getAll(double width, double height) =>
    EdgeInsets.all((width + height) / 2);
