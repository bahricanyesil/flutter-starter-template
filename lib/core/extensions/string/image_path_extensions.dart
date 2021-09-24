import 'package:flutter/material.dart';

extension ImagePathExtension on String {
  String get svgLogo => 'assets/images/logo/$this.svg';

  Image get pngImage => Image.asset('assets/images/$this.png');
  Image get pngLogo => Image.asset('assets/images/logo/$this.png');
  Image get pngIcon => Image.asset('assets/icons/$this.png');

  Image get gifAsset => Image.asset('assets/gifs/$this.gif');
}
