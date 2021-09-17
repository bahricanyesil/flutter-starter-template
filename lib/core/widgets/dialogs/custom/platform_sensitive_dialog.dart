import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

abstract class PlatformSensitiveWidget extends StatelessWidget {
  const PlatformSensitiveWidget({Key? key}) : super(key: key);

  Widget androidDialog(BuildContext context);
  Widget iosDialog(BuildContext context);
  Widget webDialog(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return webDialog(context);
    } else if (Platform.isIOS) {
      return iosDialog(context);
    } else {
      return androidDialog(context);
    }
  }
}
