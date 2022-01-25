import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/enums/view-enums/view_states.dart';
import '../../extensions/context/responsiveness_extensions.dart';
import '../../widgets/widgets_shelf.dart';
import '../view-model/base_view_model.dart';

/// Base view class to create customized view models using this.
class BaseView<T extends BaseViewModel> extends StatefulWidget {
  /// Default constructor for [BaseView].
  const BaseView({
    required this.bodyBuilder,
    this.floatingButton,
    this.customDispose,
    this.customInitState,
    this.appBar,
    this.resizeToAvoidBottomInset = true,
    this.safeArea = true,
    Key? key,
  }) : super(key: key);

  /// Function to build the body.
  final Widget Function(BuildContext) bodyBuilder;

  /// Custom floating action button in the scaffold.
  final Widget? floatingButton;

  /// Custom dispose method to call on dispose.
  final VoidCallback? customDispose;

  /// Custom init state method to call on init state.
  final VoidCallback? customInitState;

  /// Custom app bar.
  final DefaultAppBar? appBar;

  /// Determines whether to resize to avoid bottom inset in [Scaffold].
  final bool resizeToAvoidBottomInset;

  /// Determines whether to wrap with [SafeArea].
  final bool safeArea;

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late T model = context.read<T>();

  @override
  void initState() {
    super.initState();
    if (widget.customInitState != null) widget.customInitState!();
  }

  @override
  void dispose() {
    model.disposeLocal();
    if (widget.customDispose != null) widget.customDispose!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    model = context.read<T>();
    return Scaffold(
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      appBar: widget.appBar?.copyWithSize(context.responsiveSize * 18),
      body: widget.safeArea ? SafeArea(child: _child) : _child,
      floatingActionButton: widget.floatingButton,
    );
  }

  Widget get _child => context.select<T, ViewStates>((T p) => p.state) ==
          ViewStates.uninitialized
      ? const Center(child: LoadingIndicator())
      : widget.bodyBuilder(context);
}
