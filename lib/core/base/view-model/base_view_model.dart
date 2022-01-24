import 'dart:async';

import 'package:flutter/material.dart';
import '../../constants/enums/view-enums/view_states.dart';
import '../../managers/navigation/navigation_manager.dart';

/// Base view model class to create customized view models extending this.
abstract class BaseViewModel extends ChangeNotifier {
  /// Default constructor of [BaseViewModel].
  BaseViewModel() {
    _init();
  }

  ViewStates _viewState = ViewStates.uninitialized;

  /// Getter for [_viewState], shows the current state of the view.
  ViewStates get state => _viewState;

  /// Singleton navigation manager to use across the view models.
  final NavigationManager navigationManager = NavigationManager.instance;

  /// Custom init method to call before the initialization process is completed.
  FutureOr<void> init();

  Future<void> _init() async {
    await init();
    if (_viewState == ViewStates.disposed) return;
    _viewState = ViewStates.loaded;
    notifyListeners();
  }

  /// Locally dispose the view and sets the [_viewState] property.
  void disposeLocal() => _viewState = ViewStates.disposed;

  /// Reloads the state.
  void reloadState() {
    if (_viewState != ViewStates.loading && _viewState != ViewStates.disposed) {
      notifyListeners();
    }
  }

  /// Switches the loading status between
  /// [ViewStates.loaded] and [ViewStates.loading].
  void toggleLoading() {
    switch (_viewState) {
      case ViewStates.loading:
        _viewState = ViewStates.loaded;
        break;
      case ViewStates.loaded:
        _viewState = ViewStates.loading;
        break;
      default:
        break;
    }

    if (_viewState != ViewStates.disposed) notifyListeners();
  }
}
