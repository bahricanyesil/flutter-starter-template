import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/enums/view_states.dart';
import '../../widgets/appbars/app_bar.dart';
import '../view-model/base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext) bodyBuilder;
  final List<Widget>? appBarChildren;
  final double? appBarSize;

  const BaseView({
    required this.bodyBuilder,
    this.appBarChildren,
    this.appBarSize,
    Key? key,
  }) : super(key: key);

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  @override
  void initState() {
    context.read<T>().context = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      context.watch<T>().state == ViewStates.uninitialized
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              appBar: _getAppBar(),
              body: SafeArea(child: widget.bodyBuilder(context)),
            );

  DefaultAppBar? _getAppBar() =>
      widget.appBarChildren != null && widget.appBarSize != null
          ? DefaultAppBar(
              size: widget.appBarSize!, children: widget.appBarChildren!)
          : null;
}
