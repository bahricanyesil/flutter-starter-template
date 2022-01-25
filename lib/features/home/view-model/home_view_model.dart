import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/base/view-model/base_view_model.dart';
import '../../../core/extensions/date/date_time_extensions.dart';

/// View model to manaage the data on home screen.
class HomeViewModel extends BaseViewModel {
  late TextEditingController _controller;

  /// Dummy texts in the home screen list.
  final List<String> dummyTexts = <String>[];

  @override
  FutureOr<void> init() async {
    _controller = TextEditingController();
    addItem();
  }

  /// Adds a new item to the [dummyTexts] list.
  void addItem() {
    dummyTexts.add('HEY: ${DateTime.now().dmyhms}');
    notifyListeners();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
