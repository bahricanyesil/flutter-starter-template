import 'dart:async';

import 'package:flutter/material.dart';

import '../../constants/enums/view_states.dart';
import '../../constants/navigation/navigation_constants.dart';
import '../../managers/local/local_manager.dart';
import '../../managers/navigation/navigation_manager.dart';
import '../../models/response/l_response_model.dart';
import '../../widgets/dialogs/dialog_builder.dart';
import '../model/base_error.dart';

abstract class BaseViewModel extends ChangeNotifier {
  late final BuildContext context;

  BaseViewModel() {
    _init();
  }

  ViewStates _viewState = ViewStates.uninitialized;
  ViewStates get state => _viewState;

  FutureOr<void> init();

  Future<void> _init() async {
    await init();
    _viewState = ViewStates.loaded;
    notifyListeners();
  }

  void reloadState() {
    if (_viewState != ViewStates.loading && _viewState != ViewStates.disposed) {
      scheduleMicrotask(notifyListeners);
    }
  }

  void toggleLoadingStatus() {
    if (_viewState == ViewStates.loading) _viewState = ViewStates.loaded;
    if (_viewState == ViewStates.loaded) _viewState = ViewStates.loading;
    if (_viewState != ViewStates.disposed) scheduleMicrotask(notifyListeners);
  }

  @override
  void dispose() {
    _viewState = ViewStates.disposed;
    super.dispose();
  }

  final LocalManager localManager = LocalManager.instance;
  final NavigationManager navigationManager = NavigationManager.instance;

  Future<void> apiRequestLoading<T>({
    required Future<IResponseModel<T>> Function() func,
    FutureOr<dynamic> Function()? afterRequest,
  }) async {
    final bool _showLoading = _viewState != ViewStates.disposed;
    _viewState = ViewStates.loading;
    if (_showLoading) DialogBuilder(context).showLoadingIndicator();
    final IResponseModel<T> response = await func();
    await errorCheck<T>(response: response, afterFunction: afterRequest);
  }

  Future<void> errorCheck<T>({
    required IResponseModel<T> response,
    FutureOr<dynamic> Function()? afterFunction,
  }) async {
    if (response.error is IErrorModel) {
      Navigator.of(context).pop();
      if (response.error!.isAuthenticationError) {
        dispose();
        await navigationManager.navigateToPageClear(
            path: NavigationConstants.login);
      } else {
        await DialogBuilder(context)
            .showTextDialog(response.error!.errorMessage);
      }
    } else {
      if (afterFunction != null) await afterFunction();
      Navigator.of(context).pop();
    }
    _viewState = ViewStates.loaded;
    reloadState();
  }
}
