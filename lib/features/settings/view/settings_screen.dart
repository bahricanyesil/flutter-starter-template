import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/constants/enums/view-enums/sizes.dart';
import '../../../core/decoration/text_styles.dart';
import '../../../core/extensions/extensions_shelf.dart';
import '../../../core/providers/providers_shelf.dart';
import '../../../core/theme/color/l_colors.dart';
import '../../../core/widgets/checkbox/custom_checkbox_tile.dart';
import '../../../core/widgets/text/colored-text/bullet_colored_text.dart';
import '../../../core/widgets/widgets_shelf.dart';
import '../../../product/constants/enums/product_enums_shelf.dart';
import '../../../product/managers/local-storage/settings/settings_local_manager.dart';
import '../constants/settings_texts.dart';
import '../utilities/listen_settings_value.dart';
import '../view-model/settings_view_model.dart';

part 'components/settings_item.dart';
part 'components/settings_language_row.dart';
part 'components/settings_switch_tile.dart';

/// Settings settings of the app.
/// User can set the visible task sections and
/// other adjustments for the tasks in this screen
class SettingsScreen extends StatelessWidget with SettingsTexts {
  /// Default constructor for [SettingsScreen].
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<SettingsViewModel>(
        bodyBuilder: _bodyBuilder,
        appBar: DefaultAppBar(
          titleText: SettingsTexts.title,
          titleIcon: Icons.settings_outlined,
          showBack: true,
          textStyle: TextStyles(context).titleStyle(color: AppColors.white),
        ),
      );

  Widget _bodyBuilder(BuildContext context) => ListView.builder(
        itemCount: SettingsOptions.values.length,
        padding: context.allPadding(Sizes.med),
        itemBuilder: (BuildContext context, int index) => Column(
          children: <Widget>[
            _SettingsItem(settings: SettingsOptions.values[index]),
            const CustomDivider(),
          ],
        ),
      );
}
