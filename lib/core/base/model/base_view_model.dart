import 'dart:async';

import 'package:flutter/material.dart';
import '../../constants/navigation/navigation_constants.dart';

import '../../managers/managers_shelf.dart';
import '../../models/response/l_response_model.dart';
import '../../widgets/dialogs/dialog_builder.dart';
import 'base_error.dart';

abstract class BaseViewModel extends ChangeNotifier {
  BaseViewModel() {
    _init();
  }

  FutureOr<void> _initState;
  FutureOr<void> init();
  bool _isLoading = false;
  bool _isDisposed = false;
  bool _isInitializeDone = false;

  FutureOr<void> get initState => _initState;

  bool get isLoading => _isLoading;
  bool get isDisposed => _isDisposed;
  bool get isInitialized => _isInitializeDone;

  final LocalManager localManager = LocalManager.instance;
  final NavigationManager navigationManager = NavigationManager.instance;

  Future<void> _init() async {
    _isLoading = true;
    _initState = init();
    await _initState;
    _isInitializeDone = true;
    _isLoading = false;
    notifyListeners();
  }

  void reloadState() {
    if (!isLoading) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  Future<void> changeLoadingStatus(BuildContext? context) async {
    setLoading();
    if (!_isDisposed && context != null) {
      if (_isLoading) {
        await DialogBuilder(context).showLoadingIndicator();
      } else {
        Navigator.of(context).pop();
      }
    }
    reloadState();
  }

  void setLoading() {
    _isLoading = !_isLoading;
  }

  Future<bool> errorCheck<T>(IResponseModel<T> response, BuildContext? context,
      [Future<void> Function()? futureFunc]) async {
    if (response.error is BaseError) {
      if (context != null) {
        Navigator.of(context).pop();
        await DialogBuilder(context)
            .showTextDialog(response.error!.errorMessage());
      }
      if (!response.error!.isAuthenticated()) {
        dispose();
        await navigationManager.navigateToPageClear(
            path: NavigationConstants.login);
      }
      setLoading();
      return true;
    }
    if (futureFunc != null) await futureFunc();
    await changeLoadingStatus(context);
    return false;
  }
}
