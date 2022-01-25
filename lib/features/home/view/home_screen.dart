import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/constants/enums/view-enums/sizes.dart';
import '../../../core/decoration/text_styles.dart';
import '../../../core/extensions/extensions_shelf.dart';
import '../../../core/helpers/material_state_helper.dart';
import '../../../core/managers/navigation/navigation_shelf.dart';
import '../../../core/theme/color/l_colors.dart';
import '../../../core/widgets/buttons/default_icon_button.dart';
import '../../../core/widgets/widgets_shelf.dart';
import '../constants/home_texts.dart';
import '../utilities/listen_home_value.dart';
import '../view-model/home_view_model.dart';

part 'components/list_item.dart';

/// Home Screen of the app.
class HomeScreen extends StatelessWidget
    with HomeTexts, ListenHomeValue, MaterialStateHelper {
  /// Default constructor for home screen.
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<HomeViewModel>(
        bodyBuilder: _bodyBuilder,
        floatingButton: _floatingActionButton(context),
        appBar: DefaultAppBar(
          titleIcon: Icons.auto_graph_outlined,
          titleText: HomeTexts.title,
          actionsList: _appBarActions(context),
          textStyle: TextStyles(context).titleStyle(color: AppColors.white),
        ),
      );

  List<Widget> _appBarActions(BuildContext context) => <Widget>[
        DefaultIconButton(
          onPressed: () => NavigationManager.instance
              .setNewRoutePath(ScreenConfig.settings()),
          icon: Icons.settings_outlined,
          color: AppColors.white,
        ),
      ];

  Widget _bodyBuilder(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.medWidth, vertical: context.extremeLowHeight),
        child: _body(context),
      );

  Widget _body(BuildContext context) {
    final List<String> _texts = listenDummy(context);
    return Padding(
      padding: context.bottomPadding(Sizes.medHigh),
      child: ListView.builder(
        itemCount: _texts.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext ctx, int i) => Padding(
          padding: context.topPadding(Sizes.extremeLow),
          child: _ListItem<String>(data: _texts[i]),
        ),
      ),
    );
  }

  Widget _floatingActionButton(BuildContext context) => TextButton(
        onPressed: context.read<HomeViewModel>().addItem,
        style: ButtonStyle(padding: all(context.allPadding(Sizes.lowMed))),
        child: const BaseText(HomeTexts.addItem),
      );
}
