import 'package:flutter/cupertino.dart';

abstract class BaseProvider<T> implements ChangeNotifier {
  String errorMessage = '';
}
