import 'package:flutter/material.dart';

import '../../constants/border/border_radii.dart';
import '../../extensions/context/responsiveness_extension.dart';
import '../../extensions/context/theme_extension.dart';
import '../../theme/color/color_manager.dart';

class BoxDecorations {
  const BoxDecorations(this.context);
  final BuildContext context;

  static BoxDecoration assetImageDeco(String assetName) => BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetName),
          fit: BoxFit.cover,
        ),
      );

  BoxDecoration get listItemDeco => BoxDecoration(
        borderRadius: BorderRadii.mediumCircular,
        color: context.primaryDarkColor.withOpacity(.2),
      );

  static BoxDecoration get roundedInfoDeco => const BoxDecoration(
        borderRadius: BorderRadii.lowMedCircular,
        color: AppColors.lightGrey,
      );

  BoxDecoration get tableDeco => BoxDecoration(
        color: AppColors.lightGrey,
        border: Border.all(
            color: context.primaryLightColor.withOpacity(.1), width: 1.5),
      );

  BoxDecoration networkImageDeco(String imagePath) => BoxDecoration(
        border: Border.all(color: context.primaryLightColor.withOpacity(.12)),
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,
        ),
      );

  BoxDecoration get listDeco => BoxDecoration(
        border: Border.all(color: context.primaryLightColor.withOpacity(.12)),
      );

  BoxDecoration circleDeco({
    Color color = Colors.white,
    Color borderColor = Colors.black54,
    double? borderWidthFactor,
  }) =>
      BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          color: borderColor,
          width: context.width * (borderWidthFactor ?? .2),
        ),
      );
}
