import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/constants/enums/view-enums/sizes.dart';
import '../../../core/decoration/text_styles.dart';
import '../../../core/extensions/extensions_shelf.dart';
import '../../../core/managers/navigation/navigation_shelf.dart';
import '../../../core/theme/color/l_colors.dart';
import '../../../core/widgets/widgets_shelf.dart';
import '../constants/home_texts.dart';
import '../utilities/listen_home_value.dart';
import '../view-model/home_view_model.dart';

part 'components/list_item.dart';

/// Home Screen of the app.
class HomeScreen extends StatelessWidget with HomeTexts, ListenHomeValue {
  /// Default constructor for home screen.
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<HomeViewModel>(
        bodyBuilder: _bodyBuilder,
        appBar: DefaultAppBar(
          titleIcon: Icons.auto_graph_outlined,
          titleText: HomeTexts.title,
          actionsList: _appBarActions(context),
          textStyle: TextStyles(context).titleStyle(color: AppColors.white),
        ),
      );

  List<Widget> _appBarActions(BuildContext context) => <Widget>[
        IconButton(
          onPressed: () => NavigationManager.instance
              .setNewRoutePath(ScreenConfig.settings()),
          icon: const BaseIcon(Icons.settings_outlined, sizeFactor: 8),
          splashRadius: 22,
        ),
      ];

  Widget _bodyBuilder(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.medWidth, vertical: context.lowHeight),
        child: _body(context, <Widget>[]),
      );

  Widget _body(BuildContext context, List<Widget> children) => Container(
        margin: context.verticalPadding(Sizes.low),
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[...children]),
      );
}
