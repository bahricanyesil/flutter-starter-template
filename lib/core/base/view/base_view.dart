import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  const BaseView({
    required this.vmBuilder,
    required this.onPageBuilder,
    this.onDispose,
    Key? key,
  }) : super(key: key);

  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T Function(BuildContext context) vmBuilder;

  final VoidCallback? onDispose;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) {
      widget.onDispose!();
    }
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<T>.value(
        value: widget.vmBuilder(context),
        child: Consumer<T>(
          builder: _buildScreenContent,
        ),
      );

  Widget _buildScreenContent(
          BuildContext context, T viewModel, Widget? child) =>
      !viewModel.isInitialized
          ? Container()
          : Stack(
              children: <Widget>[
                widget.onPageBuilder(context, viewModel),
                Visibility(
                  visible: viewModel.isLoading,
                  child: const Center(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                )
              ],
            );
}
