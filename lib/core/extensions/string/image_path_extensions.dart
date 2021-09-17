import 'package:flutter/material.dart';

extension ImagePathExtension on String {
  String get svgLogo => 'assets/images/logo/$this.svg';

  Image get pngImageAsset => Image.asset('assets/images/$this.png');
  Image get pngLogoAsset => Image.asset('assets/images/logo/$this.png');
  Image get pngIconAsset => Image.asset('assets/icons/$this.png');

  Image get gifAsset => Image.asset('assets/gifs/$this.gif');
}
