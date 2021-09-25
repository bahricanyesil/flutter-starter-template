import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/lang/lang_keys.dart';
import '../../../../core/extensions/context/theme_extension.dart';
import '../../../../core/managers/navigation/navigation_shelf.dart';
import '../../../../core/providers/theme_provider.dart';
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
            // 'logo'.pngLogo,
            BaseText(LangKeys.welcome, color: context.primaryColor),
            TextButton(
              onPressed: () async =>
                  context.read<ThemeProvider>().switchTheme(),
              child: const Text('THEME'),
            ),
            TextButton(
              onPressed: () async => context.read<LoginViewModel>().request(),
              child: const Text('LANGUAGE'),
            ),
            TextButton(
              onPressed: () =>
                  NavigationManager.instance.addPage(ScreenConfig.home()),
              child: const Text('GO'),
            ),
          ],
        ),
      );
}
