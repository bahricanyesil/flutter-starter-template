import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/lang/lang_keys.dart';
import '../../../../core/extensions/string/util_extensions.dart';
import '../../../../core/widgets/texts/base_text.dart';
import '../view-model/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<LoginViewModel>(
        bodyBuilder: bodyBuilder,
      );

  Widget bodyBuilder(BuildContext context) => Center(
        child: Column(
          children: <Widget>[
            BaseText(LangKeys.welcome.tr),
            const BaseText(LoginViewModel.screenName),
          ],
        ),
      );
}
