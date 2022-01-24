import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/base/view-model/base_view_model.dart';

/// View model to manaage the data on home screen.
class HomeViewModel extends BaseViewModel {
  late TextEditingController _controller;

  @override
  FutureOr<void> init() async {
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
