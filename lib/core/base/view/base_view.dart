import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/enums/view_states.dart';
import '../../widgets/appbars/app_bar.dart';
import '../view-model/base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext) bodyBuilder;
  final void Function()? customDispose;
  final List<Widget>? appBarChildren;
  final double? appBarSize;
  final bool safeArea;

  const BaseView({
    required this.bodyBuilder,
    this.customDispose,
    this.appBarChildren,
    this.appBarSize,
    this.safeArea = true,
    Key? key,
  }) : super(key: key);

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late final T model = context.read<T>();

  @override
  void initState() {
    super.initState();
    model.context = context;
  }

  @override
  void dispose() {
    model.disposeLocal();
    if (widget.customDispose != null) widget.customDispose!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      context.watch<T>().state == ViewStates.uninitialized
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              appBar: _getAppBar(),
              body: widget.safeArea
                  ? SafeArea(child: widget.bodyBuilder(context))
                  : widget.bodyBuilder(context),
            );

  DefaultAppBar? _getAppBar() =>
      widget.appBarChildren != null && widget.appBarSize != null
          ? DefaultAppBar(
              size: widget.appBarSize!, children: widget.appBarChildren!)
          : null;
}
