import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../constants/enums/view_types.dart';
import '../../extensions/context/responsiveness_extension.dart';

class DeviceTypeHelper {
  final BuildContext context;
  const DeviceTypeHelper(this.context);

  ViewTypes viewType({BoxConstraints? constraints}) {
    final Orientation orientation = context.orientation;
    double maxWidth = context.maxPossibleWidth;
    double maxHeight = context.maxPossibleHeight;
    if (constraints != null) {
      maxWidth = constraints.maxWidth;
      maxHeight = constraints.maxHeight;
    }
    if ((orientation == Orientation.portrait && maxWidth < 900) ||
        (orientation == Orientation.landscape && maxHeight < 600 && !kIsWeb)) {
      return ViewTypes.portrait;
    } else {
      return ViewTypes.landscape;
    }
  }

  bool get isLandscape => viewType() == ViewTypes.landscape;
}
