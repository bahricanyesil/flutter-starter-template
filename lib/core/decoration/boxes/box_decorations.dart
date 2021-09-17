import 'package:flutter/material.dart';

import '../../constants/border/border_radii.dart';
import '../../constants/colors/color_constants.dart';
import '../../extensions/context/theme_extension.dart';

class BoxDecorations {
  const BoxDecorations(this.context);
  final BuildContext context;

  static BoxDecoration assetImageDeco(String assetName) => BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetName),
          fit: BoxFit.cover,
        ),
      );

  BoxDecoration listItemDeco() => BoxDecoration(
        borderRadius: BorderRadii.mediumCircular,
        color: context.primaryDarkColor.withOpacity(.2),
      );

  static BoxDecoration roundedInfoDeco() => const BoxDecoration(
        borderRadius: BorderRadii.lowMedCircular,
        color: ColorConstants.drawerColor,
      );

  BoxDecoration tableDeco() => BoxDecoration(
        color: ColorConstants.drawerColor,
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

  BoxDecoration listDeco() => BoxDecoration(
        border: Border.all(color: context.primaryLightColor.withOpacity(.12)),
      );
}
